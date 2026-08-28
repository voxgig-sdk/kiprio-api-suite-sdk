# KiprioApiSuite Lua SDK Reference

Complete API reference for the KiprioApiSuite Lua SDK.


## KiprioApiSuiteSDK

### Constructor

```lua
local sdk = require("kiprio-api-suite_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `DnsResult(data)`

Create a new `DnsResult` entity instance. Pass `nil` for no initial data.

#### `Domain(data)`

Create a new `Domain` entity instance. Pass `nil` for no initial data.

#### `EmailValidate(data)`

Create a new `EmailValidate` entity instance. Pass `nil` for no initial data.

#### `Generate(data)`

Create a new `Generate` entity instance. Pass `nil` for no initial data.

#### `Grammar(data)`

Create a new `Grammar` entity instance. Pass `nil` for no initial data.

#### `Ipn(data)`

Create a new `Ipn` entity instance. Pass `nil` for no initial data.

#### `Redact(data)`

Create a new `Redact` entity instance. Pass `nil` for no initial data.

#### `Ssl(data)`

Create a new `Ssl` entity instance. Pass `nil` for no initial data.

#### `Utility(data)`

Create a new `Utility` entity instance. Pass `nil` for no initial data.

#### `Whoi(data)`

Create a new `Whoi` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## DnsResultEntity

```lua
local dns_result = client:DnsResult(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `string` | No |  |
| `records` | `table` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:DnsResult():load({ domain = "domain" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DnsResultEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## DomainEntity

```lua
local domain = client:Domain(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `agents` | `table` | No |  |
| `sitemaps` | `table` | No |  |
| `url` | `string` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Domain():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DomainEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## EmailValidateEntity

```lua
local email_validate = client:EmailValidate(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `confidence` | `number` | No |  |
| `disposable` | `boolean` | No |  |
| `email` | `string` | No |  |
| `free_provider` | `boolean` | No |  |
| `mx_found` | `boolean` | No |  |
| `role_based` | `boolean` | No |  |
| `suggest` | `string` | No | Suggested correction for typos |
| `syntax_ok` | `boolean` | No |  |
| `valid` | `boolean` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:EmailValidate():load({ email = "email" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `EmailValidateEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## GenerateEntity

```lua
local generate = client:Generate(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Generate():load({ url = "url" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `GenerateEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## GrammarEntity

```lua
local grammar = client:Grammar(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `correction_count` | `number` | No |  |
| `corrections` | `table` | No |  |
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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Grammar():create({
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `GrammarEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## IpnEntity

```lua
local ipn = client:Ipn(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `asn` | `string` | No |  |
| `city` | `string` | No |  |
| `country` | `string` | No |  |
| `country_code` | `string` | No |  |
| `ip` | `string` | No |  |
| `latitude` | `number` | No |  |
| `longitude` | `number` | No |  |
| `org` | `string` | No |  |
| `timezone` | `string` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Ipn():load()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `IpnEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## RedactEntity

```lua
local redact = client:Redact(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `counts` | `table` | No |  |
| `entities` | `table` | No | Include detected entity positions in response |
| `original_length` | `number` | No |  |
| `redact` | `string` | No | Comma-separated PII types to redact. |
| `redacted` | `string` | No |  |
| `text` | `string` | Yes | Text to redact |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Redact():create({
  text = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `RedactEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## SslEntity

```lua
local ssl = client:Ssl(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `cipher` | `string` | No |  |
| `days_remaining` | `number` | No |  |
| `domain` | `string` | No |  |
| `expires_at` | `string` | No |  |
| `grade` | `string` | No |  |
| `issuer` | `string` | No |  |
| `protocol` | `string` | No |  |
| `sans` | `table` | No |  |
| `subject` | `string` | No |  |
| `valid` | `boolean` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Ssl():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SslEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## UtilityEntity

```lua
local utility = client:Utility(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `algo` | `string` | No |  |
| `hash` | `string` | No |  |
| `input` | `string` | No |  |
| `length` | `number` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Utility():load({ input = "input" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `UtilityEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## WhoiEntity

```lua
local whoi = client:Whoi(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `domain` | `string` | No |  |
| `expires` | `string` | No |  |
| `nameservers` | `table` | No |  |
| `registered` | `boolean` | No |  |
| `registrar` | `string` | No |  |
| `status` | `table` | No |  |
| `updated` | `string` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Whoi():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `WhoiEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
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

