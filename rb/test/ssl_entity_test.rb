# Ssl entity test

require "minitest/autorun"
require "json"
require_relative "../KiprioApiSuite_sdk"
require_relative "runner"

class SslEntityTest < Minitest::Test
  def test_create_instance
    testsdk = KiprioApiSuiteSDK.test(nil, nil)
    ent = testsdk.Ssl(nil)
    assert !ent.nil?
  end

  # Feature #4: the entity stream(action, ...) method runs the op pipeline and
  # returns an Enumerator over result items. With the streaming feature active
  # it yields the feature's incremental output; otherwise it falls back to the
  # materialised list so stream always yields.
  def test_stream
    seed = {
      "entity" => {
        "ssl" => {
          "s1" => { "id" => "s1" },
          "s2" => { "id" => "s2" },
          "s3" => { "id" => "s3" },
        },
      },
    }

    # Fallback: streaming inactive -> yields the materialised list items.
    base = KiprioApiSuiteSDK.test(seed, nil)
    seen = base.Ssl(nil).stream("list", nil, nil).to_a
    assert_equal 3, seen.length

    # Inbound: streaming active -> yields each item from the feature.
    cfg = KiprioApiSuiteConfig.make_config
    if cfg["feature"].is_a?(Hash) && cfg["feature"].key?("streaming")
      sdk = KiprioApiSuiteSDK.test(seed, { "feature" => { "streaming" => { "active" => true } } })
      got = []
      sdk.Ssl(nil).stream("list", nil, nil).each do |item|
        if item.is_a?(Array)
          got.concat(item)
        else
          got << item
        end
      end
      assert_equal 3, got.length
    end
  end

  def test_basic_flow
    setup = ssl_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["list"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "ssl." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set KIPRIO_API_SUITE_TEST_SSL_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # Bootstrap entity data from existing test data.
    ssl_ref01_data_raw = Vs.items(Helpers.to_map(
      Vs.getpath(setup[:data], "existing.ssl")))
    ssl_ref01_data = nil
    if ssl_ref01_data_raw.length > 0
      ssl_ref01_data = Helpers.to_map(ssl_ref01_data_raw[0][1])
    end

    # LIST
    ssl_ref01_ent = client.Ssl(nil)
    ssl_ref01_match = {}

    ssl_ref01_list_result = ssl_ref01_ent.list(ssl_ref01_match, nil)
    assert ssl_ref01_list_result.is_a?(Array)

  end
end

def ssl_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "ssl", "SslTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = KiprioApiSuiteSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["ssl01", "ssl02", "ssl03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["KIPRIO_API_SUITE_TEST_SSL_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "KIPRIO_API_SUITE_TEST_SSL_ENTID" => idmap,
    "KIPRIO_API_SUITE_TEST_LIVE" => "FALSE",
    "KIPRIO_API_SUITE_TEST_EXPLAIN" => "FALSE",
    "KIPRIO_API_SUITE_APIKEY" => "NONE",
  })

  idmap_resolved = Helpers.to_map(
    env["KIPRIO_API_SUITE_TEST_SSL_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["KIPRIO_API_SUITE_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
        "apikey" => env["KIPRIO_API_SUITE_APIKEY"],
      },
      extra || {},
    ])
    client = KiprioApiSuiteSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["KIPRIO_API_SUITE_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["KIPRIO_API_SUITE_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
