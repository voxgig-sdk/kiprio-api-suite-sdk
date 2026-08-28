# KiprioApiSuite Ruby SDK Reference

Complete API reference for the KiprioApiSuite Ruby SDK.


## KiprioApiSuiteSDK

### Constructor

```ruby
require_relative 'KiprioApiSuite_sdk'

client = KiprioApiSuiteSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["apikey"]` | `String` | API key for authentication. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `KiprioApiSuiteSDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = KiprioApiSuiteSDK.test
```


### Instance Methods

#### `DnsResult(data = nil)`

Create a new `DnsResult` entity instance. Pass `nil` for no initial data.

#### `Domain(data = nil)`

Create a new `Domain` entity instance. Pass `nil` for no initial data.

#### `EmailValidate(data = nil)`

Create a new `EmailValidate` entity instance. Pass `nil` for no initial data.

#### `Generate(data = nil)`

Create a new `Generate` entity instance. Pass `nil` for no initial data.

#### `Grammar(data = nil)`

Create a new `Grammar` entity instance. Pass `nil` for no initial data.

#### `Ipn(data = nil)`

Create a new `Ipn` entity instance. Pass `nil` for no initial data.

#### `Redact(data = nil)`

Create a new `Redact` entity instance. Pass `nil` for no initial data.

#### `Ssl(data = nil)`

Create a new `Ssl` entity instance. Pass `nil` for no initial data.

#### `Utility(data = nil)`

Create a new `Utility` entity instance. Pass `nil` for no initial data.

#### `Whoi(data = nil)`

Create a new `Whoi` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## DnsResultEntity

```ruby
dns_result = client.DnsResult
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `String` | No |  |
| `records` | `Hash` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.DnsResult.load({ "domain" => "domain" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `DnsResultEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## DomainEntity

```ruby
domain = client.Domain
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `agents` | `Hash` | No |  |
| `sitemaps` | `Array` | No |  |
| `url` | `String` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Domain.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `DomainEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## EmailValidateEntity

```ruby
email_validate = client.EmailValidate
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `confidence` | `Float` | No |  |
| `disposable` | `Boolean` | No |  |
| `email` | `String` | No |  |
| `free_provider` | `Boolean` | No |  |
| `mx_found` | `Boolean` | No |  |
| `role_based` | `Boolean` | No |  |
| `suggest` | `String` | No | Suggested correction for typos |
| `syntax_ok` | `Boolean` | No |  |
| `valid` | `Boolean` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.EmailValidate.load({ "email" => "email" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `EmailValidateEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## GenerateEntity

```ruby
generate = client.Generate
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Generate.load({ "url" => "url" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `GenerateEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## GrammarEntity

```ruby
grammar = client.Grammar
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `correction_count` | `Integer` | No |  |
| `corrections` | `Array` | No |  |
| `language` | `String` | No | BCP 47 language tag |
| `text` | `String` | No | Text to check |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `correction_count` | - |
| `corrections` | - |
| `language` | - |
| `text` | Yes |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Grammar.create({
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `GrammarEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## IpnEntity

```ruby
ipn = client.Ipn
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `asn` | `String` | No |  |
| `city` | `String` | No |  |
| `country` | `String` | No |  |
| `country_code` | `String` | No |  |
| `ip` | `String` | No |  |
| `latitude` | `Float` | No |  |
| `longitude` | `Float` | No |  |
| `org` | `String` | No |  |
| `timezone` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Ipn.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `IpnEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## RedactEntity

```ruby
redact = client.Redact
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `counts` | `Hash` | No |  |
| `entities` | `Array` | No | Include detected entity positions in response |
| `original_length` | `Integer` | No |  |
| `redact` | `String` | No | Comma-separated PII types to redact. |
| `redacted` | `String` | No |  |
| `text` | `String` | Yes | Text to redact |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Redact.create({
  "text" => "example_text", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `RedactEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## SslEntity

```ruby
ssl = client.Ssl
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `cipher` | `String` | No |  |
| `days_remaining` | `Integer` | No |  |
| `domain` | `String` | No |  |
| `expires_at` | `String` | No |  |
| `grade` | `String` | No |  |
| `issuer` | `String` | No |  |
| `protocol` | `String` | No |  |
| `sans` | `Array` | No |  |
| `subject` | `String` | No |  |
| `valid` | `Boolean` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Ssl.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `SslEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## UtilityEntity

```ruby
utility = client.Utility
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `algo` | `String` | No |  |
| `hash` | `String` | No |  |
| `input` | `String` | No |  |
| `length` | `Integer` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Utility.load({ "input" => "input" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `UtilityEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## WhoiEntity

```ruby
whoi = client.Whoi
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No |  |
| `domain` | `String` | No |  |
| `expires` | `String` | No |  |
| `nameservers` | `Array` | No |  |
| `registered` | `Boolean` | No |  |
| `registrar` | `String` | No |  |
| `status` | `Array` | No |  |
| `updated` | `String` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Whoi.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `WhoiEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ruby
client = KiprioApiSuiteSDK.new({
  "feature" => {
    "test" => { "active" => true },
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

