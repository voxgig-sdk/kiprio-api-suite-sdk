<?php
declare(strict_types=1);

// KiprioApiSuite SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class KiprioApiSuiteFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new KiprioApiSuiteBaseFeature();
            case "test":
                return new KiprioApiSuiteTestFeature();
            default:
                return new KiprioApiSuiteBaseFeature();
        }
    }
}
