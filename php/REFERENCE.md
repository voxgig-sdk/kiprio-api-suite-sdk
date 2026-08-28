# KiprioApiSuite PHP SDK Reference

Complete API reference for the KiprioApiSuite PHP SDK.


## KiprioApiSuiteSDK

### Constructor

```php
require_once __DIR__ . '/kiprioapisuite_sdk.php';

$client = new KiprioApiSuiteSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["apikey"]` | `string` | API key for authentication. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `KiprioApiSuiteSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = KiprioApiSuiteSDK::test();
```


### Instance Methods

#### `DnsResult($data = null)`

Create a new `DnsResultEntity` instance. Pass `null` for no initial data.

#### `Domain($data = null)`

Create a new `DomainEntity` instance. Pass `null` for no initial data.

#### `EmailValidate($data = null)`

Create a new `EmailValidateEntity` instance. Pass `null` for no initial data.

#### `Generate($data = null)`

Create a new `GenerateEntity` instance. Pass `null` for no initial data.

#### `Grammar($data = null)`

Create a new `GrammarEntity` instance. Pass `null` for no initial data.

#### `Ipn($data = null)`

Create a new `IpnEntity` instance. Pass `null` for no initial data.

#### `Redact($data = null)`

Create a new `RedactEntity` instance. Pass `null` for no initial data.

#### `Ssl($data = null)`

Create a new `SslEntity` instance. Pass `null` for no initial data.

#### `Utility($data = null)`

Create a new `UtilityEntity` instance. Pass `null` for no initial data.

#### `Whoi($data = null)`

Create a new `WhoiEntity` instance. Pass `null` for no initial data.

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): KiprioApiSuiteUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## DnsResultEntity

```php
$dns_result = $client->DnsResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `string` | No |  |
| `records` | `array` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->DnsResult()->load(["domain" => "domain"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): DnsResultEntity`

Create a new `DnsResultEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## DomainEntity

```php
$domain = $client->Domain();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `agents` | `array` | No |  |
| `sitemaps` | `array` | No |  |
| `url` | `string` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Domain()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): DomainEntity`

Create a new `DomainEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## EmailValidateEntity

```php
$email_validate = $client->EmailValidate();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `confidence` | `float` | No |  |
| `disposable` | `bool` | No |  |
| `email` | `string` | No |  |
| `free_provider` | `bool` | No |  |
| `mx_found` | `bool` | No |  |
| `role_based` | `bool` | No |  |
| `suggest` | `string` | No | Suggested correction for typos |
| `syntax_ok` | `bool` | No |  |
| `valid` | `bool` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->EmailValidate()->load(["email" => "email"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): EmailValidateEntity`

Create a new `EmailValidateEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## GenerateEntity

```php
$generate = $client->Generate();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Generate()->load(["url" => "url"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): GenerateEntity`

Create a new `GenerateEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## GrammarEntity

```php
$grammar = $client->Grammar();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `correction_count` | `int` | No |  |
| `corrections` | `array` | No |  |
| `language` | `string` | No | BCP 47 language tag |
| `text` | `string` | No | Text to check |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `correction_count` | - |
| `corrections` | - |
| `language` | - |
| `text` | Yes |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Grammar()->create([
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): GrammarEntity`

Create a new `GrammarEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## IpnEntity

```php
$ipn = $client->Ipn();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `asn` | `string` | No |  |
| `city` | `string` | No |  |
| `country` | `string` | No |  |
| `country_code` | `string` | No |  |
| `ip` | `string` | No |  |
| `latitude` | `float` | No |  |
| `longitude` | `float` | No |  |
| `org` | `string` | No |  |
| `timezone` | `string` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Ipn()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): IpnEntity`

Create a new `IpnEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## RedactEntity

```php
$redact = $client->Redact();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `counts` | `array` | No |  |
| `entities` | `array` | No | Include detected entity positions in response |
| `original_length` | `int` | No |  |
| `redact` | `string` | No | Comma-separated PII types to redact. |
| `redacted` | `string` | No |  |
| `text` | `string` | Yes | Text to redact |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Redact()->create([
  "text" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): RedactEntity`

Create a new `RedactEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## SslEntity

```php
$ssl = $client->Ssl();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `cipher` | `string` | No |  |
| `days_remaining` | `int` | No |  |
| `domain` | `string` | No |  |
| `expires_at` | `string` | No |  |
| `grade` | `string` | No |  |
| `issuer` | `string` | No |  |
| `protocol` | `string` | No |  |
| `sans` | `array` | No |  |
| `subject` | `string` | No |  |
| `valid` | `bool` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Ssl()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): SslEntity`

Create a new `SslEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## UtilityEntity

```php
$utility = $client->Utility();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `algo` | `string` | No |  |
| `hash` | `string` | No |  |
| `input` | `string` | No |  |
| `length` | `int` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Utility()->load(["input" => "input"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): UtilityEntity`

Create a new `UtilityEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## WhoiEntity

```php
$whoi = $client->Whoi();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `domain` | `string` | No |  |
| `expires` | `string` | No |  |
| `nameservers` | `array` | No |  |
| `registered` | `bool` | No |  |
| `registrar` | `string` | No |  |
| `status` | `array` | No |  |
| `updated` | `string` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Whoi()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): WhoiEntity`

Create a new `WhoiEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new KiprioApiSuiteSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### `test`

In-memory mock transport for testing without a live server.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.

