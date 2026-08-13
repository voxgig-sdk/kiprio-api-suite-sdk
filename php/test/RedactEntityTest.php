<?php
declare(strict_types=1);

// Redact entity test

require_once __DIR__ . '/../kiprioapisuite_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class RedactEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = KiprioApiSuiteSDK::test(null, null);
        $ent = $testsdk->Redact(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = redact_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "redact." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set KIPRIO_API_SUITE_TEST_REDACT_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // CREATE
        $redact_ref01_ent = $client->Redact(null);
        $redact_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.redact"), "redact_ref01"));

        $redact_ref01_data_result = $redact_ref01_ent->create($redact_ref01_data, null);
        $redact_ref01_data = Helpers::to_map(is_object($redact_ref01_data_result) && method_exists($redact_ref01_data_result, 'data_get') ? $redact_ref01_data_result->data_get() : $redact_ref01_data_result);
        $this->assertNotNull($redact_ref01_data);

    }
}

function redact_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/redact/RedactTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = KiprioApiSuiteSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["redact01", "redact02", "redact03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("KIPRIO_API_SUITE_TEST_REDACT_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "KIPRIO_API_SUITE_TEST_REDACT_ENTID" => $idmap,
        "KIPRIO_API_SUITE_TEST_LIVE" => "FALSE",
        "KIPRIO_API_SUITE_TEST_EXPLAIN" => "FALSE",
        "KIPRIO_API_SUITE_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["KIPRIO_API_SUITE_TEST_REDACT_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }

    if ($env["KIPRIO_API_SUITE_TEST_LIVE"] === "TRUE") {
        $merged_opts = Vs::merge([
            [
                "apikey" => $env["KIPRIO_API_SUITE_APIKEY"],
            ],
            $extra ?? [],
        ]);
        $client = new KiprioApiSuiteSDK(Helpers::to_map($merged_opts));
    }

    $live = $env["KIPRIO_API_SUITE_TEST_LIVE"] === "TRUE";
    return [
        "client" => $client,
        "data" => $entity_data,
        "idmap" => $idmap_resolved,
        "env" => $env,
        "explain" => $env["KIPRIO_API_SUITE_TEST_EXPLAIN"] === "TRUE",
        "live" => $live,
        "synthetic_only" => $live && !$idmap_overridden,
        "now" => (int)(microtime(true) * 1000),
    ];
}
