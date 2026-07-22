# Ssl direct test

require "minitest/autorun"
require "json"
require_relative "../KiprioApiSuite_sdk"
require_relative "runner"

class SslDirectTest < Minitest::Test
  def test_direct_list_ssl
    setup = ssl_direct_setup([
      { "id" => "direct01" },
      { "id" => "direct02" },
    ])
    _should_skip, _reason = Runner.is_control_skipped("direct", "direct-list-ssl", setup[:live] ? "live" : "unit")
    if _should_skip
      skip(_reason || "skipped via sdk-test-control.json")
      return
    end
    client = setup[:client]


    result = client.direct({
      "path" => "ssl",
      "method" => "GET",
      "params" => {},
    })
    if setup[:live]
      # Live mode is lenient: synthetic IDs frequently 4xx and the list-
      # response shape varies wildly across public APIs. Skip rather than
      # fail when the call doesn't return a usable list.
      if !result["err"].nil?
        skip("list call failed (likely synthetic IDs against live API): #{result["err"]}")
        return
      end
      unless result["ok"]
        skip("list call not ok (likely synthetic IDs against live API)")
        return
      end
      status = Helpers.to_int(result["status"])
      if status < 200 || status >= 300
        skip("expected 2xx status, got #{status}")
        return
      end
    else
      assert_nil result["err"]
      assert result["ok"]
      assert_equal 200, Helpers.to_int(result["status"])
      assert result["data"].is_a?(Array)
      assert_equal 2, result["data"].length
      assert_equal 1, setup[:calls].length
    end
  end

end


def ssl_direct_setup(mockres)
  Runner.load_env_local

  calls = []

  env = Runner.env_override({
    "KIPRIOAPISUITE_TEST_SSL_ENTID" => {},
    "KIPRIOAPISUITE_TEST_LIVE" => "FALSE",
    "KIPRIOAPISUITE_APIKEY" => "NONE",
  })

  live = env["KIPRIOAPISUITE_TEST_LIVE"] == "TRUE"

  if live
    merged_opts = {
      "apikey" => env["KIPRIOAPISUITE_APIKEY"],
    }
    client = KiprioApiSuiteSDK.new(merged_opts)
    return {
      client: client,
      calls: calls,
      live: true,
      idmap: {},
    }
  end

  mock_fetch = ->(url, init) {
    calls.push({ "url" => url, "init" => init })
    return {
      "status" => 200,
      "statusText" => "OK",
      "headers" => {},
      "json" => ->() {
        if !mockres.nil?
          return mockres
        end
        return { "id" => "direct01" }
      },
      "body" => "mock",
    }, nil
  }

  client = KiprioApiSuiteSDK.new({
    "base" => "http://localhost:8080",
    "system" => {
      "fetch" => mock_fetch,
    },
  })

  {
    client: client,
    calls: calls,
    live: false,
    idmap: {},
  }
end
