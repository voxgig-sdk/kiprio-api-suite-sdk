# KiprioApiSuite Ruby SDK



The Ruby SDK for the KiprioApiSuite API — an entity-oriented client using idiomatic Ruby conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.DnsResult` — with named operations (`list`/`load`/`create`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to RubyGems. Install it from the
GitHub release tag (`rb/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/kiprio-api-suite-sdk/releases](https://github.com/voxgig-sdk/kiprio-api-suite-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ruby
require_relative "KiprioApiSuite_sdk"

client = KiprioApiSuiteSDK.new({
  "apikey" => ENV["KIPRIO_API_SUITE_APIKEY"],
})
```

### 3. Load a dnsresult

```ruby
begin
  # load returns the ENTITY — call data_get for the DnsResult record (raises on error).
  dnsresult = client.DnsResult.load()
  puts dnsresult
rescue => err
  warn "load failed: #{err}"
end
```


## Error handling

Entity operations raise on failure, so rescue them:

```ruby
begin
  utility = client.Utility.load()
rescue => err
  warn "load failed: #{err}"
end
```

`direct` does **not** raise — it returns the result hash. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example_id" },
})

warn "request failed: #{result["err"] || "HTTP #{result["status"]}"}" unless result["ok"]
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})

if result["ok"]
  puts result["status"]  # 200
  puts result["data"]    # response body
else
  # On an HTTP error status there is no err (only a transport failure sets
  # it), so fall back to the status code.
  warn(result["err"] || "HTTP #{result["status"]}")
end
```

### Prepare a request without sending it

```ruby
begin
  fetchdef = client.prepare({
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => { "id" => "example" },
  })
  puts fetchdef["url"]
  puts fetchdef["method"]
  puts fetchdef["headers"]
rescue => err
  warn "prepare failed: #{err}"
end
```

### Use test mode

Create a mock client for unit testing — no server required:

```ruby
client = KiprioApiSuiteSDK.test

# Entity ops return the ENTITY (raises on error);
# call data_get for the mock record.
utility = client.Utility.load()
puts utility
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ruby
mock_fetch = ->(url, init) {
  return {
    "status" => 200,
    "statusText" => "OK",
    "headers" => {},
    "json" => ->() { { "id" => "mock01" } },
  }, nil
}

client = KiprioApiSuiteSDK.new({
  "base" => "http://localhost:8080",
  "system" => {
    "fetch" => mock_fetch,
  },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
KIPRIO_API_SUITE_TEST_LIVE=TRUE
KIPRIO_API_SUITE_APIKEY=<your-key>
```

Then run:

```bash
cd rb && ruby -Itest -e "Dir['test/*_test.rb'].each { |f| require_relative f }"
```


## Reference

### KiprioApiSuiteSDK

```ruby
require_relative "KiprioApiSuite_sdk"
client = KiprioApiSuiteSDK.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Hash` | Feature activation flags. |
| `extend` | `Hash` | Additional Feature instances to load. |
| `system` | `Hash` | System overrides (e.g. custom `fetch` lambda). |

### test

```ruby
client = KiprioApiSuiteSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### KiprioApiSuiteSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Hash` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Hash` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Hash` | Build and send an HTTP request. Returns a result hash (`result["ok"]`); does not raise. |
| `DnsResult` | `(data) -> DnsResultEntity` | Create a DnsResult entity instance. |
| `Domain` | `(data) -> DomainEntity` | Create a Domain entity instance. |
| `EmailValidate` | `(data) -> EmailValidateEntity` | Create an EmailValidate entity instance. |
| `Generate` | `(data) -> GenerateEntity` | Create a Generate entity instance. |
| `Grammar` | `(data) -> GrammarEntity` | Create a Grammar entity instance. |
| `Ipn` | `(data) -> IpnEntity` | Create an Ipn entity instance. |
| `Redact` | `(data) -> RedactEntity` | Create a Redact entity instance. |
| `Ssl` | `(data) -> SslEntity` | Create a Ssl entity instance. |
| `Utility` | `(data) -> UtilityEntity` | Create an Utility entity instance. |
| `Whoi` | `(data) -> WhoiEntity` | Create a Whoi entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch = nil, ctrl) -> Array` | List entities matching the criteria (call with no argument to list all). Raises on error. |
| `create` | `(reqdata, ctrl) -> any` | Create a new entity. Raises on error. |
| `data_get` | `() -> Hash` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> Hash` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the result data directly. On failure they
raise a `KiprioApiSuiteError` (a `StandardError` subclass), so wrap
calls in `begin`/`rescue` where you need to handle errors.

The `direct` escape hatch is the exception: it never raises and instead
returns a result `Hash` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Integer` | HTTP status code. |
| `headers` | `Hash` | Response headers. |
| `data` | `any` | Parsed JSON response body. |
| `err` | `Error` | Present when `ok` is `false`. |

### Entities

#### DnsResult

| Field | Description |
| --- | --- |
| `domain` |  |
| `records` |  |

Operations: Load.

API path: `/dns-lookup`

#### Domain

| Field | Description |
| --- | --- |
| `agents` |  |
| `sitemaps` |  |
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
| `suggest` | Suggested correction for typos |
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
| `correction_count` |  |
| `corrections` |  |
| `language` | BCP 47 language tag |
| `text` | Text to check |

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
| `counts` |  |
| `entities` | Include detected entity positions in response |
| `original_length` |  |
| `redact` | Comma-separated PII types to redact. |
| `redacted` |  |
| `text` | Text to redact |

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
| `sans` |  |
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
| `expires` |  |
| `nameservers` |  |
| `registered` |  |
| `registrar` |  |
| `status` |  |
| `updated` |  |

Operations: List.

API path: `/whois`



## Entities


### DnsResult

Create an instance: `dns_result = client.DnsResult`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `String` |  |
| `records` | `Hash` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the DnsResult record (raises on error).
dns_result = client.DnsResult.load()
```


### Domain

Create an instance: `domain = client.Domain`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `agents` | `Hash` |  |
| `sitemaps` | `Array` |  |
| `url` | `String` |  |

#### Example: List

```ruby
# list returns an Array of Domain records (raises on error).
domains = client.Domain.list
```


### EmailValidate

Create an instance: `email_validate = client.EmailValidate`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `confidence` | `Float` |  |
| `disposable` | `Boolean` |  |
| `email` | `String` |  |
| `free_provider` | `Boolean` |  |
| `mx_found` | `Boolean` |  |
| `role_based` | `Boolean` |  |
| `suggest` | `String` | Suggested correction for typos |
| `syntax_ok` | `Boolean` |  |
| `valid` | `Boolean` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the EmailValidate record (raises on error).
email_validate = client.EmailValidate.load()
```


### Generate

Create an instance: `generate = client.Generate`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Generate record (raises on error).
generate = client.Generate.load()
```


### Grammar

Create an instance: `grammar = client.Grammar`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `correction_count` | `Integer` |  |
| `corrections` | `Array` |  |
| `language` | `String` | BCP 47 language tag |
| `text` | `String` | Text to check |

#### Example: Create

```ruby
grammar = client.Grammar.create({
})
```


### Ipn

Create an instance: `ipn = client.Ipn`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `asn` | `String` |  |
| `city` | `String` |  |
| `country` | `String` |  |
| `country_code` | `String` |  |
| `ip` | `String` |  |
| `latitude` | `Float` |  |
| `longitude` | `Float` |  |
| `org` | `String` |  |
| `timezone` | `String` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Ipn record (raises on error).
ipn = client.Ipn.load()
```


### Redact

Create an instance: `redact = client.Redact`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `counts` | `Hash` |  |
| `entities` | `Array` | Include detected entity positions in response |
| `original_length` | `Integer` |  |
| `redact` | `String` | Comma-separated PII types to redact. |
| `redacted` | `String` |  |
| `text` | `String` | Text to redact |

#### Example: Create

```ruby
redact = client.Redact.create({
  "text" => "example_text", # String
})
```


### Ssl

Create an instance: `ssl = client.Ssl`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `cipher` | `String` |  |
| `days_remaining` | `Integer` |  |
| `domain` | `String` |  |
| `expires_at` | `String` |  |
| `grade` | `String` |  |
| `issuer` | `String` |  |
| `protocol` | `String` |  |
| `sans` | `Array` |  |
| `subject` | `String` |  |
| `valid` | `Boolean` |  |

#### Example: List

```ruby
# list returns an Array of Ssl records (raises on error).
ssls = client.Ssl.list
```


### Utility

Create an instance: `utility = client.Utility`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `algo` | `String` |  |
| `hash` | `String` |  |
| `input` | `String` |  |
| `length` | `Integer` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Utility record (raises on error).
utility = client.Utility.load()
```


### Whoi

Create an instance: `whoi = client.Whoi`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `domain` | `String` |  |
| `expires` | `String` |  |
| `nameservers` | `Array` |  |
| `registered` | `Boolean` |  |
| `registrar` | `String` |  |
| `status` | `Array` |  |
| `updated` | `String` |  |

#### Example: List

```ruby
# list returns an Array of Whoi records (raises on error).
whois = client.Whoi.list
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

Features are the extension mechanism. A feature is a Ruby class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as hashes

The Ruby SDK uses plain Ruby hashes throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers.to_map()` to safely validate that a value is a hash.

### Module structure

```
rb/
├── KiprioApiSuite_sdk.rb       -- Main SDK module
├── config.rb                  -- Configuration
├── features.rb                -- Feature factory
├── core/                      -- Core types and context
├── entity/                    -- Entity implementations
├── feature/                   -- Built-in features (Base, Test, Log)
├── utility/                   -- Utility functions and struct library
└── test/                      -- Test suites
```

The main module (`KiprioApiSuite_sdk`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```ruby
utility = client.Utility
utility.load()

# utility.data_get now returns the utility data from the last load
# utility.match_get returns the last match criteria
```

Call `make` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
