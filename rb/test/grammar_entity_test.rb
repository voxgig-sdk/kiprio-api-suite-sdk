# Grammar entity test

require "minitest/autorun"
require "json"
require_relative "../KiprioApiSuite_sdk"
require_relative "runner"

class GrammarEntityTest < Minitest::Test
  def test_create_instance
    testsdk = KiprioApiSuiteSDK.test(nil, nil)
    ent = testsdk.Grammar(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = grammar_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["create"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "grammar." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set KIPRIO_API_SUITE_TEST_GRAMMAR_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # CREATE
    grammar_ref01_ent = client.Grammar(nil)
    grammar_ref01_data = Helpers.to_map(Vs.getprop(
      Vs.getpath(setup[:data], "new.grammar"), "grammar_ref01"))

    grammar_ref01_data_result = grammar_ref01_ent.create(grammar_ref01_data, nil)
    grammar_ref01_data = Helpers.to_map(grammar_ref01_data_result.respond_to?(:data_get) ? grammar_ref01_data_result.data_get : grammar_ref01_data_result)
    assert !grammar_ref01_data.nil?

  end
end

def grammar_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "grammar", "GrammarTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = KiprioApiSuiteSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["grammar01", "grammar02", "grammar03"],
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
  entid_env_raw = ENV["KIPRIO_API_SUITE_TEST_GRAMMAR_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "KIPRIO_API_SUITE_TEST_GRAMMAR_ENTID" => idmap,
    "KIPRIO_API_SUITE_TEST_LIVE" => "FALSE",
    "KIPRIO_API_SUITE_TEST_EXPLAIN" => "FALSE",
    "KIPRIO_API_SUITE_APIKEY" => "",
  })

  idmap_resolved = Helpers.to_map(
    env["KIPRIO_API_SUITE_TEST_GRAMMAR_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["KIPRIO_API_SUITE_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      # FIRST, so the generated fields below win: sdk-test-control.json's
      # test.client.options adds to the live client, it does not redirect it.
      Runner.live_client_options,
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
