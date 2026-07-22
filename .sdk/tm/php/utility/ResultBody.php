<?php
declare(strict_types=1);

// KiprioApiSuite SDK utility: result_body

class KiprioApiSuiteResultBody
{
    public static function call(KiprioApiSuiteContext $ctx): ?KiprioApiSuiteResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
