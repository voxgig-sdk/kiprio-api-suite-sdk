<?php
declare(strict_types=1);

// KiprioApiSuite SDK exists test

require_once __DIR__ . '/../kiprioapisuite_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = KiprioApiSuiteSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
