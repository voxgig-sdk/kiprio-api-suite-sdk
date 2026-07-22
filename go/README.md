# KiprioApiSuite Golang SDK



The Golang SDK for the KiprioApiSuite API — an entity-oriented client using standard Go conventions. No generics required; data flows as `map[string]any`.

It exposes the API as capitalised, semantic **Entities** — e.g. `client.DnsResult(nil)` — each with the same small set of operations (`List`, `Load`, `Create`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```bash
go get github.com/voxgig-sdk/kiprio-api-suite-sdk/go@latest
```

The Go module proxy resolves the version from the `go/vX.Y.Z` GitHub
release tag — see [Releases](https://github.com/voxgig-sdk/kiprio-api-suite-sdk/releases) for the available versions.

To vendor from a local checkout instead, clone this repo alongside your
project and add a `replace` directive pointing at the checked-out
`go/` directory:

```bash
go mod edit -replace github.com/voxgig-sdk/kiprio-api-suite-sdk/go=../kiprio-api-suite-sdk/go
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### Quickstart

A complete program: create a client, then call the entity operations.
Each operation returns `(value, error)` — the value is the data itself
(there is no `{ok, data}` wrapper), so check `err` and use the value
directly.

```go
package main

import (
    "fmt"
    "os"
    sdk "github.com/voxgig-sdk/kiprio-api-suite-sdk/go"
)

func main() {
    client := sdk.NewKiprioApiSuiteSDK(map[string]any{
        "apikey": os.Getenv("KIPRIO_API_SUITE_APIKEY"),
    })

    // Load a single dnsResult — the value is the loaded record.
    dnsResult, err := client.DnsResult(nil).Load(nil, nil)
    if err != nil {
        panic(err)
    }
    fmt.Println(dnsResult)
}
```


## Error handling

Every entity operation returns `(value, error)`. Check `err` before
using the value — there is no exception to catch:

```go
dnsresult, err := client.DnsResult(nil).Load(nil, nil)
if err != nil {
    // handle err
    return
}
_ = dnsresult
```

`Direct` follows the same `(value, error)` convention:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example_id"},
})
if err != nil {
    // handle err
}
_ = result
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

if result["ok"] == true {
    fmt.Println(result["status"]) // 200
    fmt.Println(result["data"])   // response body
}
```

### Prepare a request without sending it

```go
fetchdef, err := client.Prepare(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "DELETE",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

fmt.Println(fetchdef["url"])
fmt.Println(fetchdef["method"])
fmt.Println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```go
client := sdk.Test()

dnsResult, err := client.DnsResult(nil).Load(
    nil, nil,
)
if err != nil {
    panic(err)
}
fmt.Println(dnsResult) // the returned mock data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```go
mockFetch := func(url string, init map[string]any) (map[string]any, error) {
    return map[string]any{
        "status":     200,
        "statusText": "OK",
        "headers":    map[string]any{},
        "json": (func() any)(func() any {
            return map[string]any{"id": "mock01"}
        }),
    }, nil
}

client := sdk.NewKiprioApiSuiteSDK(map[string]any{
    "base": "http://localhost:8080",
    "system": map[string]any{
        "fetch": (func(string, map[string]any) (map[string]any, error))(mockFetch),
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
cd go && go test ./test/...
```


## Reference

### NewKiprioApiSuiteSDK

```go
func NewKiprioApiSuiteSDK(options map[string]any) *KiprioApiSuiteSDK
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `"apikey"` | `string` | API key for authentication. |
| `"base"` | `string` | Base URL of the API server. |
| `"prefix"` | `string` | URL path prefix prepended to all requests. |
| `"suffix"` | `string` | URL path suffix appended to all requests. |
| `"feature"` | `map[string]any` | Feature activation flags. |
| `"extend"` | `[]any` | Additional Feature instances to load. |
| `"system"` | `map[string]any` | System overrides (e.g. custom `"fetch"` function). |

### TestSDK

```go
func TestSDK(testopts map[string]any, sdkopts map[string]any) *KiprioApiSuiteSDK
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### KiprioApiSuiteSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() map[string]any` | Deep copy of current SDK options. |
| `GetUtility` | `() *Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs map[string]any) (map[string]any, error)` | Build an HTTP request definition without sending. |
| `Direct` | `(fetchargs map[string]any) (map[string]any, error)` | Build and send an HTTP request. |
| `DnsResult` | `(data map[string]any) KiprioApiSuiteEntity` | Create a DnsResult entity instance. |
| `Domain` | `(data map[string]any) KiprioApiSuiteEntity` | Create a Domain entity instance. |
| `EmailValidate` | `(data map[string]any) KiprioApiSuiteEntity` | Create an EmailValidate entity instance. |
| `Generate` | `(data map[string]any) KiprioApiSuiteEntity` | Create a Generate entity instance. |
| `Grammar` | `(data map[string]any) KiprioApiSuiteEntity` | Create a Grammar entity instance. |
| `Ipn` | `(data map[string]any) KiprioApiSuiteEntity` | Create an Ipn entity instance. |
| `Redact` | `(data map[string]any) KiprioApiSuiteEntity` | Create a Redact entity instance. |
| `Ssl` | `(data map[string]any) KiprioApiSuiteEntity` | Create a Ssl entity instance. |
| `Utility` | `(data map[string]any) KiprioApiSuiteEntity` | Create an Utility entity instance. |
| `Whoi` | `(data map[string]any) KiprioApiSuiteEntity` | Create a Whoi entity instance. |

### Entity interface (KiprioApiSuiteEntity)

All entities implement the `KiprioApiSuiteEntity` interface.

| Method | Signature | Description |
| --- | --- | --- |
| `Load` | `(reqmatch, ctrl map[string]any) (any, error)` | Load a single entity by match criteria. |
| `List` | `(reqmatch, ctrl map[string]any) (any, error)` | List entities matching the criteria. |
| `Create` | `(reqdata, ctrl map[string]any) (any, error)` | Create a new entity. |
| `Data` | `(args ...any) any` | Get or set entity data. |
| `Match` | `(args ...any) any` | Get or set entity match criteria. |
| `Make` | `() Entity` | Create a new instance with the same options. |
| `GetName` | `() string` | Return the entity name. |

### Result shape

Entity operations return `(value, error)`. The `value` is the
operation's data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `Load` / `Create` | the entity record (`map[string]any`) |
| `List` | a `[]any` of entity records |

Check `err` first, then use the value directly (or the typed
`...Typed` variants, which return the entity's model struct and a typed
slice):

    dnsResult, err := client.DnsResult(nil).Load(nil, nil)
    if err != nil { /* handle */ }
    // dnsResult is the returned record

Only `Direct()` returns a response envelope — a `map[string]any` with
`"ok"`, `"status"`, `"headers"`, and `"data"` keys.

### Entities

#### DnsResult

| Field | Description |
| --- | --- |
| `"domain"` |  |
| `"record"` |  |

Operations: Load.

API path: `/dns-lookup`

#### Domain

| Field | Description |
| --- | --- |
| `"agent"` |  |
| `"sitemap"` |  |
| `"url"` |  |

Operations: List.

API path: `/robots-txt`

#### EmailValidate

| Field | Description |
| --- | --- |
| `"confidence"` |  |
| `"disposable"` |  |
| `"email"` |  |
| `"free_provider"` |  |
| `"mx_found"` |  |
| `"role_based"` |  |
| `"suggest"` |  |
| `"syntax_ok"` |  |
| `"valid"` |  |

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
| `"correction"` |  |
| `"correction_count"` |  |
| `"language"` |  |
| `"text"` |  |

Operations: Create.

API path: `/grammar`

#### Ipn

| Field | Description |
| --- | --- |
| `"asn"` |  |
| `"city"` |  |
| `"country"` |  |
| `"country_code"` |  |
| `"ip"` |  |
| `"latitude"` |  |
| `"longitude"` |  |
| `"org"` |  |
| `"timezone"` |  |

Operations: Load.

API path: `/ip`

#### Redact

| Field | Description |
| --- | --- |
| `"count"` |  |
| `"entity"` |  |
| `"original_length"` |  |
| `"redact"` |  |
| `"redacted"` |  |
| `"text"` |  |

Operations: Create.

API path: `/redact`

#### Ssl

| Field | Description |
| --- | --- |
| `"cipher"` |  |
| `"days_remaining"` |  |
| `"domain"` |  |
| `"expires_at"` |  |
| `"grade"` |  |
| `"issuer"` |  |
| `"protocol"` |  |
| `"san"` |  |
| `"subject"` |  |
| `"valid"` |  |

Operations: List.

API path: `/ssl`

#### Utility

| Field | Description |
| --- | --- |
| `"algo"` |  |
| `"hash"` |  |
| `"input"` |  |
| `"length"` |  |

Operations: Load.

API path: `/hash`

#### Whoi

| Field | Description |
| --- | --- |
| `"created"` |  |
| `"domain"` |  |
| `"expire"` |  |
| `"nameserver"` |  |
| `"registered"` |  |
| `"registrar"` |  |
| `"status"` |  |
| `"updated"` |  |

Operations: List.

API path: `/whois`



## Entities


### DnsResult

Create an instance: `dnsResult := client.DnsResult(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `string` |  |
| `record` | `map[string]any` |  |

#### Example: Load

```go
dnsResult, err := client.DnsResult(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(dnsResult) // the loaded record
```


### Domain

Create an instance: `domain := client.Domain(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `agent` | `map[string]any` |  |
| `sitemap` | `[]any` |  |
| `url` | `string` |  |

#### Example: List

```go
domains, err := client.Domain(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(domains) // the array of records
```


### EmailValidate

Create an instance: `emailValidate := client.EmailValidate(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `confidence` | `float64` |  |
| `disposable` | `bool` |  |
| `email` | `string` |  |
| `free_provider` | `bool` |  |
| `mx_found` | `bool` |  |
| `role_based` | `bool` |  |
| `suggest` | `string` |  |
| `syntax_ok` | `bool` |  |
| `valid` | `bool` |  |

#### Example: Load

```go
emailValidate, err := client.EmailValidate(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(emailValidate) // the loaded record
```


### Generate

Create an instance: `generate := client.Generate(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
generate, err := client.Generate(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(generate) // the loaded record
```


### Grammar

Create an instance: `grammar := client.Grammar(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `correction` | `[]any` |  |
| `correction_count` | `int` |  |
| `language` | `string` |  |
| `text` | `string` |  |

#### Example: Create

```go
result, err := client.Grammar(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### Ipn

Create an instance: `ipn := client.Ipn(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `asn` | `string` |  |
| `city` | `string` |  |
| `country` | `string` |  |
| `country_code` | `string` |  |
| `ip` | `string` |  |
| `latitude` | `float64` |  |
| `longitude` | `float64` |  |
| `org` | `string` |  |
| `timezone` | `string` |  |

#### Example: Load

```go
ipn, err := client.Ipn(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(ipn) // the loaded record
```


### Redact

Create an instance: `redact := client.Redact(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `count` | `map[string]any` |  |
| `entity` | `[]any` |  |
| `original_length` | `int` |  |
| `redact` | `string` |  |
| `redacted` | `string` |  |
| `text` | `string` |  |

#### Example: Create

```go
result, err := client.Redact(nil).Create(map[string]any{
    "text": "example_text",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### Ssl

Create an instance: `ssl := client.Ssl(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

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
| `san` | `[]any` |  |
| `subject` | `string` |  |
| `valid` | `bool` |  |

#### Example: List

```go
ssls, err := client.Ssl(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(ssls) // the array of records
```


### Utility

Create an instance: `utility := client.Utility(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `algo` | `string` |  |
| `hash` | `string` |  |
| `input` | `string` |  |
| `length` | `int` |  |

#### Example: Load

```go
utility, err := client.Utility(nil).Load(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(utility) // the loaded record
```


### Whoi

Create an instance: `whoi := client.Whoi(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` |  |
| `domain` | `string` |  |
| `expire` | `string` |  |
| `nameserver` | `[]any` |  |
| `registered` | `bool` |  |
| `registrar` | `string` |  |
| `status` | `[]any` |  |
| `updated` | `string` |  |

#### Example: List

```go
whois, err := client.Whoi(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(whois) // the array of records
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

Features are the extension mechanism. A feature implements the
`Feature` interface and provides hooks — functions keyed by pipeline
stage names.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as maps

The Go SDK uses `map[string]any` throughout rather than typed structs.
This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `core.ToMapAny()` to safely cast results and nested data.

### Package structure

```
github.com/voxgig-sdk/kiprio-api-suite-sdk/go/
├── kiprio-api-suite.go        # Root package — type aliases and constructors
├── core/               # SDK core — client, types, pipeline
├── entity/             # Entity implementations
├── feature/            # Built-in features (Base, Test, Log)
├── utility/            # Utility functions and struct library
└── test/               # Test suites
```

The root package (`github.com/voxgig-sdk/kiprio-api-suite-sdk/go`) re-exports everything needed
for normal use. Import sub-packages only when you need specific types
like `core.ToMapAny`.

### Entity state

Entity instances are stateful. After a successful `Load`, the entity
stores the returned data and match criteria internally.

```go
dnsresult := client.DnsResult(nil)
dnsresult.Load(nil, nil)

// dnsresult.Data() now returns the dnsresult data from the last load
// dnsresult.Match() returns the last match criteria
```

Call `Make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`Direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `Prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
