# KiprioApiSuite Lua SDK



The Lua SDK for the KiprioApiSuite API — an entity-oriented client using Lua conventions.

It exposes the API as capitalised, semantic **Entities** — e.g. `client:DnsResult()` — each with the same small set of operations (`list`, `load`, `create`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to LuaRocks. Install it from the
GitHub release tag (`lua/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/kiprio-api-suite-sdk/releases)),
or add the source directory to your `LUA_PATH`:

```bash
export LUA_PATH="path/to/lua/?.lua;path/to/lua/?/init.lua;;"
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```lua
local sdk = require("kiprio-api-suite_sdk")

local client = sdk.new({
  apikey = os.getenv("KIPRIO_API_SUITE_APIKEY"),
})
```

### 3. Load a dnsresult

```lua
local dnsresult, err = client:DnsResult():load()
if err then error(err) end
print(dnsresult)
```


## Error handling

Entity operations return `(value, err)`. Check `err` before using
the value:

```lua
local utility, err = client:Utility():load()
if err then error(err) end
```

`direct` follows the same `(value, err)` convention:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example_id" },
})
if err then error(err) end
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
if err then error(err) end

if result["ok"] then
  print(result["status"])  -- 200
  print(result["data"])    -- response body
end
```

### Prepare a request without sending it

```lua
local fetchdef, err = client:prepare({
  path = "/api/resource/{id}",
  method = "DELETE",
  params = { id = "example" },
})
if err then error(err) end

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```lua
local client = sdk.test()

local result, err = client:Utility():load()
-- result is the returned data; err is set on failure
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```lua
local function mock_fetch(url, init)
  return {
    status = 200,
    statusText = "OK",
    headers = {},
    json = function()
      return { id = "mock01" }
    end,
  }, nil
end

local client = sdk.new({
  base = "http://localhost:8080",
  system = {
    fetch = mock_fetch,
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
cd lua && busted test/
```


## Reference

### KiprioApiSuiteSDK

```lua
local sdk = require("kiprio-api-suite_sdk")
local client = sdk.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `table` | Feature activation flags. |
| `extend` | `table` | Additional Feature instances to load. |
| `system` | `table` | System overrides (e.g. custom `fetch` function). |

### test

```lua
local client = sdk.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### KiprioApiSuiteSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> table` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> table, err` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs) -> table, err` | Build and send an HTTP request. |
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
| `load` | `(reqmatch, ctrl) -> any, err` | Load a single entity by match criteria. |
| `list` | `(reqmatch, ctrl) -> any, err` | List entities matching the criteria. |
| `create` | `(reqdata, ctrl) -> any, err` | Create a new entity. |
| `data_get` | `() -> table` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> table` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return `(value, err)`. The `value` is the operation's
data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `load` / `create` | the entity record (a `table`) |
| `list` | an array (`table`) of entity records |

Check `err` first (it is non-`nil` on failure), then use `value`:

    local dns_result, err = client:DnsResult():load()
    if err then error(err) end
    -- dns_result is the loaded record

Only `direct()` returns a response envelope — a `table` with `ok`,
`status`, `headers`, and `data` keys.

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
| `correction_count` |  |
| `corrections` |  |
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
| `counts` |  |
| `entities` |  |
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

Create an instance: `local dns_result = client:DnsResult(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `string` |  |
| `records` | `table` |  |

#### Example: Load

```lua
local dns_result, err = client:DnsResult():load()
```


### Domain

Create an instance: `local domain = client:Domain(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `agents` | `table` |  |
| `sitemaps` | `table` |  |
| `url` | `string` |  |

#### Example: List

```lua
local domains, err = client:Domain():list()
```


### EmailValidate

Create an instance: `local email_validate = client:EmailValidate(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `confidence` | `number` |  |
| `disposable` | `boolean` |  |
| `email` | `string` |  |
| `free_provider` | `boolean` |  |
| `mx_found` | `boolean` |  |
| `role_based` | `boolean` |  |
| `suggest` | `string` |  |
| `syntax_ok` | `boolean` |  |
| `valid` | `boolean` |  |

#### Example: Load

```lua
local email_validate, err = client:EmailValidate():load()
```


### Generate

Create an instance: `local generate = client:Generate(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```lua
local generate, err = client:Generate():load()
```


### Grammar

Create an instance: `local grammar = client:Grammar(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `correction_count` | `number` |  |
| `corrections` | `table` |  |
| `language` | `string` |  |
| `text` | `string` |  |

#### Example: Create

```lua
local grammar, err = client:Grammar():create({
})
```


### Ipn

Create an instance: `local ipn = client:Ipn(nil)`

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
| `latitude` | `number` |  |
| `longitude` | `number` |  |
| `org` | `string` |  |
| `timezone` | `string` |  |

#### Example: Load

```lua
local ipn, err = client:Ipn():load()
```


### Redact

Create an instance: `local redact = client:Redact(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `counts` | `table` |  |
| `entities` | `table` |  |
| `original_length` | `number` |  |
| `redact` | `string` |  |
| `redacted` | `string` |  |
| `text` | `string` |  |

#### Example: Create

```lua
local redact, err = client:Redact():create({
  text = "example_text", -- string
})
```


### Ssl

Create an instance: `local ssl = client:Ssl(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `cipher` | `string` |  |
| `days_remaining` | `number` |  |
| `domain` | `string` |  |
| `expires_at` | `string` |  |
| `grade` | `string` |  |
| `issuer` | `string` |  |
| `protocol` | `string` |  |
| `sans` | `table` |  |
| `subject` | `string` |  |
| `valid` | `boolean` |  |

#### Example: List

```lua
local ssls, err = client:Ssl():list()
```


### Utility

Create an instance: `local utility = client:Utility(nil)`

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
| `length` | `number` |  |

#### Example: Load

```lua
local utility, err = client:Utility():load()
```


### Whoi

Create an instance: `local whoi = client:Whoi(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` |  |
| `domain` | `string` |  |
| `expires` | `string` |  |
| `nameservers` | `table` |  |
| `registered` | `boolean` |  |
| `registrar` | `string` |  |
| `status` | `table` |  |
| `updated` | `string` |  |

#### Example: List

```lua
local whois, err = client:Whoi():list()
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

Features are the extension mechanism. A feature is a Lua table
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as tables

The Lua SDK uses plain Lua tables throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a table.

### Module structure

```
lua/
├── kiprio-api-suite_sdk.lua    -- Main SDK module
├── config.lua               -- Configuration
├── features.lua             -- Feature factory
├── core/                    -- Core types and context
├── entity/                  -- Entity implementations
├── feature/                 -- Built-in features (Base, Test, Log)
├── utility/                 -- Utility functions and struct library
└── test/                    -- Test suites
```

The main module (`kiprio-api-suite_sdk`) exports the SDK constructor
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```lua
local utility = client:Utility()
utility:load()

-- utility:data_get() now returns the utility data from the last load
-- utility:match_get() returns the last match criteria
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
