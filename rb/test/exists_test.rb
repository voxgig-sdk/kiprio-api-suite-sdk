# KiprioApiSuite SDK exists test

require "minitest/autorun"
require_relative "../KiprioApiSuite_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = KiprioApiSuiteSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
