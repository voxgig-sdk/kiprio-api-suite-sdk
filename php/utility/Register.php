<?php
declare(strict_types=1);

// KiprioApiSuite SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

KiprioApiSuiteUtility::setRegistrar(function (KiprioApiSuiteUtility $u): void {
    $u->clean = [KiprioApiSuiteClean::class, 'call'];
    $u->done = [KiprioApiSuiteDone::class, 'call'];
    $u->make_error = [KiprioApiSuiteMakeError::class, 'call'];
    $u->feature_add = [KiprioApiSuiteFeatureAdd::class, 'call'];
    $u->feature_hook = [KiprioApiSuiteFeatureHook::class, 'call'];
    $u->feature_init = [KiprioApiSuiteFeatureInit::class, 'call'];
    $u->fetcher = [KiprioApiSuiteFetcher::class, 'call'];
    $u->make_fetch_def = [KiprioApiSuiteMakeFetchDef::class, 'call'];
    $u->make_context = [KiprioApiSuiteMakeContext::class, 'call'];
    $u->make_options = [KiprioApiSuiteMakeOptions::class, 'call'];
    $u->make_request = [KiprioApiSuiteMakeRequest::class, 'call'];
    $u->make_response = [KiprioApiSuiteMakeResponse::class, 'call'];
    $u->make_result = [KiprioApiSuiteMakeResult::class, 'call'];
    $u->make_point = [KiprioApiSuiteMakePoint::class, 'call'];
    $u->make_spec = [KiprioApiSuiteMakeSpec::class, 'call'];
    $u->make_url = [KiprioApiSuiteMakeUrl::class, 'call'];
    $u->param = [KiprioApiSuiteParam::class, 'call'];
    $u->prepare_auth = [KiprioApiSuitePrepareAuth::class, 'call'];
    $u->prepare_body = [KiprioApiSuitePrepareBody::class, 'call'];
    $u->prepare_headers = [KiprioApiSuitePrepareHeaders::class, 'call'];
    $u->prepare_method = [KiprioApiSuitePrepareMethod::class, 'call'];
    $u->prepare_params = [KiprioApiSuitePrepareParams::class, 'call'];
    $u->prepare_path = [KiprioApiSuitePreparePath::class, 'call'];
    $u->prepare_query = [KiprioApiSuitePrepareQuery::class, 'call'];
    $u->result_basic = [KiprioApiSuiteResultBasic::class, 'call'];
    $u->result_body = [KiprioApiSuiteResultBody::class, 'call'];
    $u->result_headers = [KiprioApiSuiteResultHeaders::class, 'call'];
    $u->transform_request = [KiprioApiSuiteTransformRequest::class, 'call'];
    $u->transform_response = [KiprioApiSuiteTransformResponse::class, 'call'];
});
