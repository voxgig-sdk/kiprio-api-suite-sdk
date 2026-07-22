<?php
declare(strict_types=1);

// KiprioApiSuite SDK utility: result_headers

class KiprioApiSuiteResultHeaders
{
    public static function call(KiprioApiSuiteContext $ctx): ?KiprioApiSuiteResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
