# KiprioApiSuite PHP SDK



The PHP SDK for the KiprioApiSuite API — an entity-oriented client using PHP conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `$client->DnsResult()` — with named operations (`list`/`load`/`create`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Packagist. Install it from the
GitHub release tag (`php/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/kiprio-api-suite-sdk/releases](https://github.com/voxgig-sdk/kiprio-api-suite-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```php
<?php
require_once 'kiprioapisuite_sdk.php';

$client = new KiprioApiSuiteSDK([
    "apikey" => getenv("KIPRIO_API_SUITE_APIKEY"),
]);
```

### 3. Load a dnsresult

```php
try {
    // load() returns the bare DnsResult record (throws on error).
    $dnsresult = $client->DnsResult()->load();
    print_r($dnsresult);
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```


## Error handling

Entity operations throw a `\Throwable` on failure, so wrap them in
`try` / `catch`:

```php
try {
    $dnsresult = $client->DnsResult()->load();
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```

`direct()` does **not** throw — it returns the result array. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```php
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example_id"],
]);

if (! $result["ok"]) {
    $err = $result["err"] ?? null;
    echo "request failed: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```php
// direct() is the raw-HTTP escape hatch: it returns a result array
// (it does not throw). Branch on $result["ok"].
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);

if ($result["ok"]) {
    echo $result["status"];  // 200
    print_r($result["data"]);  // response body
} else {
    // On an HTTP error status there is no err (only a transport failure sets
    // it), so fall back to the status code.
    $err = $result["err"] ?? null;
    echo "Error: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```

### Prepare a request without sending it

```php
// prepare() throws on error and returns the fetch definition.
$fetchdef = $client->prepare([
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => ["id" => "example"],
]);

echo $fetchdef["url"];
echo $fetchdef["method"];
print_r($fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required:

```php
$client = KiprioApiSuiteSDK::test();

// Entity ops return the bare mock record (throws on error).
$dnsresult = $client->DnsResult()->load();
print_r($dnsresult);
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```php
$mock_fetch = function ($url, $init) {
    return [
        [
            "status" => 200,
            "statusText" => "OK",
            "headers" => [],
            "json" => function () { return ["id" => "mock01"]; },
        ],
        null,
    ];
};

$client = new KiprioApiSuiteSDK([
    "base" => "http://localhost:8080",
    "system" => [
        "fetch" => $mock_fetch,
    ],
]);
```

### Run live tests

Create a `.env.local` file at the project root:

```
KIPRIO_API_SUITE_TEST_LIVE=TRUE
KIPRIO_API_SUITE_APIKEY=<your-key>
```

Then run:

```bash
cd php && ./vendor/bin/phpunit test/
```


## Reference

### KiprioApiSuiteSDK

```php
require_once 'kiprioapisuite_sdk.php';
$client = new KiprioApiSuiteSDK($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `array` | Feature activation flags. |
| `extend` | `array` | Additional Feature instances to load. |
| `system` | `array` | System overrides (e.g. custom `fetch` callable). |

### test

```php
$client = KiprioApiSuiteSDK::test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### KiprioApiSuiteSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `(): array` | Deep copy of current SDK options. |
| `get_utility` | `(): Utility` | Copy of the SDK utility object. |
| `prepare` | `(array $fetchargs): array` | Build an HTTP request definition without sending. |
| `direct` | `(array $fetchargs): array` | Build and send an HTTP request. |
| `DnsResult` | `($data): DnsResultEntity` | Create a DnsResult entity instance. |
| `Domain` | `($data): DomainEntity` | Create a Domain entity instance. |
| `EmailValidate` | `($data): EmailValidateEntity` | Create an EmailValidate entity instance. |
| `Generate` | `($data): GenerateEntity` | Create a Generate entity instance. |
| `Grammar` | `($data): GrammarEntity` | Create a Grammar entity instance. |
| `Ipn` | `($data): IpnEntity` | Create an Ipn entity instance. |
| `Redact` | `($data): RedactEntity` | Create a Redact entity instance. |
| `Ssl` | `($data): SslEntity` | Create a Ssl entity instance. |
| `Utility` | `($data): UtilityEntity` | Create an Utility entity instance. |
| `Whoi` | `($data): WhoiEntity` | Create a Whoi entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl): array` | Load a single entity by match criteria. |
| `list` | `(?array $reqmatch = null, $ctrl): array` | List entities matching the criteria (call with no argument to list all). |
| `create` | `($reqdata, $ctrl): array` | Create a new entity. |
| `data_get` | `(): array` | Get entity data. |
| `data_set` | `($data): void` | Set entity data. |
| `match_get` | `(): array` | Get entity match criteria. |
| `match_set` | `($match): void` | Set entity match criteria. |
| `make` | `(): Entity` | Create a new instance with the same options. |
| `get_name` | `(): string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (an `array` for single-entity
ops, a `list` for `list`) and throw on error. Wrap calls in
`try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `array`
you branch on via `$result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `array` | Response headers. |
| `data` | `mixed` | Parsed JSON response body. |

On error, `ok` is `false` and `$err` contains the error value.

### Entities

#### DnsResult

| Field | Description |
| --- | --- |
| `domain` |  |
| `record` |  |

Operations: Load.

API path: `/dns-lookup`

#### Domain

| Field | Description |
| --- | --- |
| `agent` |  |
| `sitemap` |  |
| `url` |  |

Operations: List.

API path: `/robots-txt`

#### EmailValidate

| Field | Description |
| --- | --- |
| `confidence` |  |
| `disposable` |  |
| `email` |  |
| `free_provider` |  |
| `mx_found` |  |
| `role_based` |  |
| `suggest` |  |
| `syntax_ok` |  |
| `valid` |  |

Operations: Load.

API path: `/email-validate`

#### Generate

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/qr`

#### Grammar

| Field | Description |
| --- | --- |
| `correction` |  |
| `correction_count` |  |
| `language` |  |
| `text` |  |

Operations: Create.

API path: `/grammar`

#### Ipn

| Field | Description |
| --- | --- |
| `asn` |  |
| `city` |  |
| `country` |  |
| `country_code` |  |
| `ip` |  |
| `latitude` |  |
| `longitude` |  |
| `org` |  |
| `timezone` |  |

Operations: Load.

API path: `/ip`

#### Redact

| Field | Description |
| --- | --- |
| `count` |  |
| `entity` |  |
| `original_length` |  |
| `redact` |  |
| `redacted` |  |
| `text` |  |

Operations: Create.

API path: `/redact`

#### Ssl

| Field | Description |
| --- | --- |
| `cipher` |  |
| `days_remaining` |  |
| `domain` |  |
| `expires_at` |  |
| `grade` |  |
| `issuer` |  |
| `protocol` |  |
| `san` |  |
| `subject` |  |
| `valid` |  |

Operations: List.

API path: `/ssl`

#### Utility

| Field | Description |
| --- | --- |
| `algo` |  |
| `hash` |  |
| `input` |  |
| `length` |  |

Operations: Load.

API path: `/hash`

#### Whoi

| Field | Description |
| --- | --- |
| `created` |  |
| `domain` |  |
| `expire` |  |
| `nameserver` |  |
| `registered` |  |
| `registrar` |  |
| `status` |  |
| `updated` |  |

Operations: List.

API path: `/whois`



## Entities


### DnsResult

Create an instance: `$dns_result = $client->DnsResult();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `string` |  |
| `record` | `array` |  |

#### Example: Load

```php
// load() returns the bare DnsResult record (throws on error).
$dns_result = $client->DnsResult()->load();
```


### Domain

Create an instance: `$domain = $client->Domain();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `agent` | `array` |  |
| `sitemap` | `array` |  |
| `url` | `string` |  |

#### Example: List

```php
// list() returns an array of Domain records (throws on error).
$domains = $client->Domain()->list();
```


### EmailValidate

Create an instance: `$email_validate = $client->EmailValidate();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `confidence` | `float` |  |
| `disposable` | `bool` |  |
| `email` | `string` |  |
| `free_provider` | `bool` |  |
| `mx_found` | `bool` |  |
| `role_based` | `bool` |  |
| `suggest` | `string` |  |
| `syntax_ok` | `bool` |  |
| `valid` | `bool` |  |

#### Example: Load

```php
// load() returns the bare EmailValidate record (throws on error).
$email_validate = $client->EmailValidate()->load();
```


### Generate

Create an instance: `$generate = $client->Generate();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```php
// load() returns the bare Generate record (throws on error).
$generate = $client->Generate()->load();
```


### Grammar

Create an instance: `$grammar = $client->Grammar();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `correction` | `array` |  |
| `correction_count` | `int` |  |
| `language` | `string` |  |
| `text` | `string` |  |

#### Example: Create

```php
$grammar = $client->Grammar()->create([
]);
```


### Ipn

Create an instance: `$ipn = $client->Ipn();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `asn` | `string` |  |
| `city` | `string` |  |
| `country` | `string` |  |
| `country_code` | `string` |  |
| `ip` | `string` |  |
| `latitude` | `float` |  |
| `longitude` | `float` |  |
| `org` | `string` |  |
| `timezone` | `string` |  |

#### Example: Load

```php
// load() returns the bare Ipn record (throws on error).
$ipn = $client->Ipn()->load();
```


### Redact

Create an instance: `$redact = $client->Redact();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `count` | `array` |  |
| `entity` | `array` |  |
| `original_length` | `int` |  |
| `redact` | `string` |  |
| `redacted` | `string` |  |
| `text` | `string` |  |

#### Example: Create

```php
$redact = $client->Redact()->create([
    "text" => null, // string
]);
```


### Ssl

Create an instance: `$ssl = $client->Ssl();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `cipher` | `string` |  |
| `days_remaining` | `int` |  |
| `domain` | `string` |  |
| `expires_at` | `string` |  |
| `grade` | `string` |  |
| `issuer` | `string` |  |
| `protocol` | `string` |  |
| `san` | `array` |  |
| `subject` | `string` |  |
| `valid` | `bool` |  |

#### Example: List

```php
// list() returns an array of Ssl records (throws on error).
$ssls = $client->Ssl()->list();
```


### Utility

Create an instance: `$utility = $client->Utility();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `algo` | `string` |  |
| `hash` | `string` |  |
| `input` | `string` |  |
| `length` | `int` |  |

#### Example: Load

```php
// load() returns the bare Utility record (throws on error).
$utility = $client->Utility()->load();
```


### Whoi

Create an instance: `$whoi = $client->Whoi();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` |  |
| `domain` | `string` |  |
| `expire` | `string` |  |
| `nameserver` | `array` |  |
| `registered` | `bool` |  |
| `registrar` | `string` |  |
| `status` | `array` |  |
| `updated` | `string` |  |

#### Example: List

```php
// list() returns an array of Whoi records (throws on error).
$whois = $client->Whoi()->list();
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is a PHP class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as arrays

The PHP SDK uses plain PHP associative arrays throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers::to_map()` to safely validate that a value is an array.

### Directory structure

```
php/
├── kiprioapisuite_sdk.php          -- Main SDK class
├── config.php                     -- Configuration
├── features.php                   -- Feature factory
├── core/                          -- Core types and context
├── entity/                        -- Entity implementations
├── feature/                       -- Built-in features (Base, Test, Log)
├── utility/                       -- Utility functions and struct library
└── test/                          -- Test suites
```

The main class (`kiprioapisuite_sdk.php`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```php
$dnsresult = $client->DnsResult();
$dnsresult->load();

// $dnsresult->data_get() now returns the dnsresult data from the last load
// $dnsresult->match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
