# KiprioApiSuite Golang SDK Reference

Complete API reference for the KiprioApiSuite Golang SDK.


## KiprioApiSuiteSDK

### Constructor

```go
func NewKiprioApiSuiteSDK(options map[string]any) *KiprioApiSuiteSDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["apikey"]` | `string` | API key for authentication. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `Test() *KiprioApiSuiteSDK`

No-arg convenience constructor for the common no-options test case.

```go
client := sdk.Test()
```

#### `TestSDK(testopts, sdkopts map[string]any) *KiprioApiSuiteSDK`

Test client with options. Both arguments may be `nil`.

```go
client := sdk.TestSDK(testopts, sdkopts)
```


### Instance Methods

#### `DnsResult(data map[string]any) KiprioApiSuiteEntity`

Create a new `DnsResult` entity instance. Pass `nil` for no initial data.

#### `Domain(data map[string]any) KiprioApiSuiteEntity`

Create a new `Domain` entity instance. Pass `nil` for no initial data.

#### `EmailValidate(data map[string]any) KiprioApiSuiteEntity`

Create a new `EmailValidate` entity instance. Pass `nil` for no initial data.

#### `Generate(data map[string]any) KiprioApiSuiteEntity`

Create a new `Generate` entity instance. Pass `nil` for no initial data.

#### `Grammar(data map[string]any) KiprioApiSuiteEntity`

Create a new `Grammar` entity instance. Pass `nil` for no initial data.

#### `Ipn(data map[string]any) KiprioApiSuiteEntity`

Create a new `Ipn` entity instance. Pass `nil` for no initial data.

#### `Redact(data map[string]any) KiprioApiSuiteEntity`

Create a new `Redact` entity instance. Pass `nil` for no initial data.

#### `Ssl(data map[string]any) KiprioApiSuiteEntity`

Create a new `Ssl` entity instance. Pass `nil` for no initial data.

#### `Utility(data map[string]any) KiprioApiSuiteEntity`

Create a new `Utility` entity instance. Pass `nil` for no initial data.

#### `Whoi(data map[string]any) KiprioApiSuiteEntity`

Create a new `Whoi` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## DnsResultEntity

```go
dnsResult := client.DnsResult(nil)
fmt.Println(dnsResult.GetName()) // "dns_result"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `string` | No |  |
| `records` | `map[string]any` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.DnsResult(nil).Load(map[string]any{"domain": "domain"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `DnsResultEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## DomainEntity

```go
domain := client.Domain(nil)
fmt.Println(domain.GetName()) // "domain"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `agents` | `map[string]any` | No |  |
| `sitemaps` | `[]any` | No |  |
| `url` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Domain(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `DomainEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## EmailValidateEntity

```go
emailValidate := client.EmailValidate(nil)
fmt.Println(emailValidate.GetName()) // "email_validate"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `confidence` | `float64` | No |  |
| `disposable` | `bool` | No |  |
| `email` | `string` | No |  |
| `free_provider` | `bool` | No |  |
| `mx_found` | `bool` | No |  |
| `role_based` | `bool` | No |  |
| `suggest` | `string` | No | Suggested correction for typos |
| `syntax_ok` | `bool` | No |  |
| `valid` | `bool` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.EmailValidate(nil).Load(map[string]any{"email": "email"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `EmailValidateEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## GenerateEntity

```go
generate := client.Generate(nil)
fmt.Println(generate.GetName()) // "generate"
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Generate(nil).Load(map[string]any{"url": "url"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `GenerateEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## GrammarEntity

```go
grammar := client.Grammar(nil)
fmt.Println(grammar.GetName()) // "grammar"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `correction_count` | `int` | No |  |
| `corrections` | `[]any` | No |  |
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

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Grammar(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `GrammarEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## IpnEntity

```go
ipn := client.Ipn(nil)
fmt.Println(ipn.GetName()) // "ipn"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `asn` | `string` | No |  |
| `city` | `string` | No |  |
| `country` | `string` | No |  |
| `country_code` | `string` | No |  |
| `ip` | `string` | No |  |
| `latitude` | `float64` | No |  |
| `longitude` | `float64` | No |  |
| `org` | `string` | No |  |
| `timezone` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Ipn(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `IpnEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## RedactEntity

```go
redact := client.Redact(nil)
fmt.Println(redact.GetName()) // "redact"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `counts` | `map[string]any` | No |  |
| `entities` | `[]any` | No | Include detected entity positions in response |
| `original_length` | `int` | No |  |
| `redact` | `string` | No | Comma-separated PII types to redact. |
| `redacted` | `string` | No |  |
| `text` | `string` | Yes | Text to redact |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Redact(nil).Create(map[string]any{
    "text": "example_text",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `RedactEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## SslEntity

```go
ssl := client.Ssl(nil)
fmt.Println(ssl.GetName()) // "ssl"
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
| `sans` | `[]any` | No |  |
| `subject` | `string` | No |  |
| `valid` | `bool` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Ssl(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `SslEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## UtilityEntity

```go
utility := client.Utility(nil)
fmt.Println(utility.GetName()) // "utility"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `algo` | `string` | No |  |
| `hash` | `string` | No |  |
| `input` | `string` | No |  |
| `length` | `int` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Utility(nil).Load(map[string]any{"input": "input"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `UtilityEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## WhoiEntity

```go
whoi := client.Whoi(nil)
fmt.Println(whoi.GetName()) // "whoi"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `domain` | `string` | No |  |
| `expires` | `string` | No |  |
| `nameservers` | `[]any` | No |  |
| `registered` | `bool` | No |  |
| `registrar` | `string` | No |  |
| `status` | `[]any` | No |  |
| `updated` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Whoi(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `WhoiEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewKiprioApiSuiteSDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
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

