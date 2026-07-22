<?php
declare(strict_types=1);

// KiprioApiSuite SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class KiprioApiSuiteMakeContext
{
    public static function call(array $ctxmap, ?KiprioApiSuiteContext $basectx): KiprioApiSuiteContext
    {
        return new KiprioApiSuiteContext($ctxmap, $basectx);
    }
}
