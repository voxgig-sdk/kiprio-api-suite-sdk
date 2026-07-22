# KiprioApiSuite SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

KiprioApiSuiteUtility.registrar = ->(u) {
  u.clean = KiprioApiSuiteUtilities::Clean
  u.done = KiprioApiSuiteUtilities::Done
  u.make_error = KiprioApiSuiteUtilities::MakeError
  u.feature_add = KiprioApiSuiteUtilities::FeatureAdd
  u.feature_hook = KiprioApiSuiteUtilities::FeatureHook
  u.feature_init = KiprioApiSuiteUtilities::FeatureInit
  u.fetcher = KiprioApiSuiteUtilities::Fetcher
  u.make_fetch_def = KiprioApiSuiteUtilities::MakeFetchDef
  u.make_context = KiprioApiSuiteUtilities::MakeContext
  u.make_options = KiprioApiSuiteUtilities::MakeOptions
  u.make_request = KiprioApiSuiteUtilities::MakeRequest
  u.make_response = KiprioApiSuiteUtilities::MakeResponse
  u.make_result = KiprioApiSuiteUtilities::MakeResult
  u.make_point = KiprioApiSuiteUtilities::MakePoint
  u.make_spec = KiprioApiSuiteUtilities::MakeSpec
  u.make_url = KiprioApiSuiteUtilities::MakeUrl
  u.param = KiprioApiSuiteUtilities::Param
  u.prepare_auth = KiprioApiSuiteUtilities::PrepareAuth
  u.prepare_body = KiprioApiSuiteUtilities::PrepareBody
  u.prepare_headers = KiprioApiSuiteUtilities::PrepareHeaders
  u.prepare_method = KiprioApiSuiteUtilities::PrepareMethod
  u.prepare_params = KiprioApiSuiteUtilities::PrepareParams
  u.prepare_path = KiprioApiSuiteUtilities::PreparePath
  u.prepare_query = KiprioApiSuiteUtilities::PrepareQuery
  u.result_basic = KiprioApiSuiteUtilities::ResultBasic
  u.result_body = KiprioApiSuiteUtilities::ResultBody
  u.result_headers = KiprioApiSuiteUtilities::ResultHeaders
  u.transform_request = KiprioApiSuiteUtilities::TransformRequest
  u.transform_response = KiprioApiSuiteUtilities::TransformResponse
}
