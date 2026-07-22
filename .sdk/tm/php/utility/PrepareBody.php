<?php
declare(strict_types=1);

// KiprioApiSuite SDK utility: prepare_body

class KiprioApiSuitePrepareBody
{
    public static function call(KiprioApiSuiteContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
