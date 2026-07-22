<?php
declare(strict_types=1);

// KiprioApiSuite SDK base feature

class KiprioApiSuiteBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(KiprioApiSuiteContext $ctx, array $options): void {}
    public function PostConstruct(KiprioApiSuiteContext $ctx): void {}
    public function PostConstructEntity(KiprioApiSuiteContext $ctx): void {}
    public function SetData(KiprioApiSuiteContext $ctx): void {}
    public function GetData(KiprioApiSuiteContext $ctx): void {}
    public function GetMatch(KiprioApiSuiteContext $ctx): void {}
    public function SetMatch(KiprioApiSuiteContext $ctx): void {}
    public function PrePoint(KiprioApiSuiteContext $ctx): void {}
    public function PreSpec(KiprioApiSuiteContext $ctx): void {}
    public function PreRequest(KiprioApiSuiteContext $ctx): void {}
    public function PreResponse(KiprioApiSuiteContext $ctx): void {}
    public function PreResult(KiprioApiSuiteContext $ctx): void {}
    public function PreDone(KiprioApiSuiteContext $ctx): void {}
    public function PreUnexpected(KiprioApiSuiteContext $ctx): void {}
}
