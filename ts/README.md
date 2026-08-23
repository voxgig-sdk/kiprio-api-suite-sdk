# KiprioApiSuite TypeScript SDK



The TypeScript SDK for the KiprioApiSuite API — a type-safe, entity-oriented client with full async/await support.

The API is exposed as capitalised, semantic **Entities** — e.g.
`client.DnsResult()` — each with a small set of operations (`list`, `load`, `create`)
instead of raw URL paths and query parameters. This keeps the surface
predictable and low-friction for both humans and AI agents.

> Also generated from this model: `go`, `go-cli`, `go-mcp`, `lua`, `php`, `py`, `rb` — see
> the [top-level README](../README.md).


## Install
This package is not yet published to npm. Install it from the GitHub
release tag (`ts/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/kiprio-api-suite-sdk/releases](https://github.com/voxgig-sdk/kiprio-api-suite-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ts
import { KiprioApiSuiteSDK } from '@voxgig-sdk/kiprio-api-suite'

const client = new KiprioApiSuiteSDK({
  apikey: process.env.KIPRIO_API_SUITE_APIKEY,
})
```

### 3. Load a dnsresult

`load()` returns the entity directly and throws on failure:

```ts
try {
  const dnsresult = await client.DnsResult().load()
  console.log(dnsresult)
} catch (err) {
  console.error('load failed:', err)
}
```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const utility = await client.Utility().load()
  console.log(utility)
} catch (err) {
  console.error('load failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})

if (result instanceof Error) {
  throw result
}
if (result.ok) {
  console.log(result.status)  // 200
  console.log(result.data)    // response body
}
```

### Prepare a request without sending it

```ts
const fetchdef = await client.prepare({
  path: '/api/resource/{id}',
  method: 'DELETE',
  params: { id: 'example' },
})

// Inspect before sending
console.log(fetchdef.url)
console.log(fetchdef.method)
console.log(fetchdef.headers)
```

### Use test mode

Create a mock client for unit testing — no server required:

```ts
const client = KiprioApiSuiteSDK.test()

const utility = await client.Utility().load()
// utility is the entity, populated with mock response data
// — call utility.data() for the record itself
console.log(utility)
```

You can also use the instance method:

```ts
const client = new KiprioApiSuiteSDK({ apikey: '...' })
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```ts
const entity = client.Utility()

// First call runs the operation and stores its result
await entity.load()

// Subsequent calls reuse the stored state
const data = entity.data()
console.log(data)
```

### Add custom middleware

Pass features via the `extend` option:

```ts
const logger = {
  hooks: {
    PreRequest: (ctx: any) => {
      console.log('Requesting:', ctx.spec.method, ctx.spec.path)
    },
    PreResponse: (ctx: any) => {
      console.log('Status:', ctx.out.request?.status)
    },
  },
}

const client = new KiprioApiSuiteSDK({
  apikey: '...',
  extend: [logger],
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
cd ts && npm test
```


## Reference

### KiprioApiSuiteSDK

#### Constructor

```ts
new KiprioApiSuiteSDK(options?: {
  apikey?: string
  base?: string
  prefix?: string
  suffix?: string
  feature?: Record<string, { active: boolean }>
  extend?: Feature[]
})
```

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `object` | Feature activation flags (e.g. `{ test: { active: true } }`). |
| `extend` | `Feature[]` | Additional feature instances to load. |

#### Methods

| Method | Returns | Description |
| --- | --- | --- |
| `options()` | `object` | Deep copy of current SDK options. |
| `utility()` | `Utility` | Deep copy of the SDK utility object. |
| `prepare(fetchargs?)` | `Promise<FetchDef>` | Build an HTTP request definition without sending it. |
| `direct(fetchargs?)` | `Promise<DirectResult>` | Build and send an HTTP request. |
| `DnsResult(data?)` | `DnsResultEntity` | Create a DnsResult entity instance. |
| `Domain(data?)` | `DomainEntity` | Create a Domain entity instance. |
| `EmailValidate(data?)` | `EmailValidateEntity` | Create an EmailValidate entity instance. |
| `Generate(data?)` | `GenerateEntity` | Create a Generate entity instance. |
| `Grammar(data?)` | `GrammarEntity` | Create a Grammar entity instance. |
| `Ipn(data?)` | `IpnEntity` | Create an Ipn entity instance. |
| `Redact(data?)` | `RedactEntity` | Create a Redact entity instance. |
| `Ssl(data?)` | `SslEntity` | Create a Ssl entity instance. |
| `Utility(data?)` | `UtilityEntity` | Create an Utility entity instance. |
| `Whoi(data?)` | `WhoiEntity` | Create a Whoi entity instance. |
| `tester(testopts?, sdkopts?)` | `KiprioApiSuiteSDK` | Create a test-mode client instance. |

#### Static methods

| Method | Returns | Description |
| --- | --- | --- |
| `KiprioApiSuiteSDK.test(testopts?, sdkopts?)` | `KiprioApiSuiteSDK` | Create a test-mode client. |

### Entity interface

All entities share the same interface.

#### Methods

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `load(reqmatch?, ctrl?): Promise<Entity>` | Load a single entity by match criteria. |
| `list` | `list(reqmatch?, ctrl?): Promise<Entity[]>` | List entities matching the criteria. |
| `create` | `create(reqdata?, ctrl?): Promise<Entity>` | Create a new entity. |
| `data` | `data(data?: Partial<Entity>): Entity` | Get or set entity data. |
| `match` | `match(match?: Partial<Entity>): Partial<Entity>` | Get or set entity match criteria. |
| `make` | `make(): Entity` | Create a new instance with the same options. |
| `client` | `client(): KiprioApiSuiteSDK` | Return the parent SDK client. |
| `entopts` | `entopts(): object` | Return a copy of the entity options. |

#### Return values

Entity operations resolve to the entity data directly — there is no
result envelope:

- `load` and `create` resolve to a single entity object.
- `list` resolves to an **array** of entity objects (iterate it directly;
  there is no `.data` and no `.ok`).

On a failed request these methods **throw**, so wrap calls in
`try`/`catch` to handle errors. Only `direct()` returns the result
envelope described below.

### DirectResult shape

The `direct()` method returns:

```ts
{
  ok: boolean
  status: number
  headers: object
  data: any
}
```

On error, `ok` is `false` and an `err` property contains the error.

### FetchDef shape

The `prepare()` method returns:

```ts
{
  url: string
  method: string
  headers: Record<string, string>
  body?: any
}
```

### Entities

#### DnsResult

| Field | Description |
| --- | --- |
| `domain` |  |
| `records` |  |

Operations: load.

API path: `/dns-lookup`

#### Domain

| Field | Description |
| --- | --- |
| `agents` |  |
| `sitemaps` |  |
| `url` |  |

Operations: list.

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

Operations: load.

API path: `/email-validate`

#### Generate

| Field | Description |
| --- | --- |

Operations: load.

API path: `/qr`

#### Grammar

| Field | Description |
| --- | --- |
| `correction_count` |  |
| `corrections` |  |
| `language` | BCP 47 language tag |
| `text` | Text to check |

Operations: create.

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

Operations: load.

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

Operations: create.

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

Operations: list.

API path: `/ssl`

#### Utility

| Field | Description |
| --- | --- |
| `algo` |  |
| `hash` |  |
| `input` |  |
| `length` |  |

Operations: load.

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

Operations: list.

API path: `/whois`



## Entities


### DnsResult

Create an instance: `const dns_result = client.DnsResult()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `string` |  |
| `records` | `Record<string, any>` |  |

#### Example: Load

```ts
const dns_result = await client.DnsResult().load()
```


### Domain

Create an instance: `const domain = client.Domain()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `agents` | `Record<string, any>` |  |
| `sitemaps` | `any[]` |  |
| `url` | `string` |  |

#### Example: List

```ts
const domains = await client.Domain().list()
```


### EmailValidate

Create an instance: `const email_validate = client.EmailValidate()`

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
| `suggest` | `string` | Suggested correction for typos |
| `syntax_ok` | `boolean` |  |
| `valid` | `boolean` |  |

#### Example: Load

```ts
const email_validate = await client.EmailValidate().load()
```


### Generate

Create an instance: `const generate = client.Generate()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const generate = await client.Generate().load()
```


### Grammar

Create an instance: `const grammar = client.Grammar()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `correction_count` | `number` |  |
| `corrections` | `any[]` |  |
| `language` | `string` | BCP 47 language tag |
| `text` | `string` | Text to check |

#### Example: Create

```ts
const grammar = await client.Grammar().create({
})
```


### Ipn

Create an instance: `const ipn = client.Ipn()`

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

```ts
const ipn = await client.Ipn().load()
```


### Redact

Create an instance: `const redact = client.Redact()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `counts` | `Record<string, any>` |  |
| `entities` | `any[]` | Include detected entity positions in response |
| `original_length` | `number` |  |
| `redact` | `string` | Comma-separated PII types to redact. |
| `redacted` | `string` |  |
| `text` | `string` | Text to redact |

#### Example: Create

```ts
const redact = await client.Redact().create({
  text: 'example_text',
})
```


### Ssl

Create an instance: `const ssl = client.Ssl()`

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
| `sans` | `any[]` |  |
| `subject` | `string` |  |
| `valid` | `boolean` |  |

#### Example: List

```ts
const ssls = await client.Ssl().list()
```


### Utility

Create an instance: `const utility = client.Utility()`

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

```ts
const utility = await client.Utility().load()
```


### Whoi

Create an instance: `const whoi = client.Whoi()`

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
| `nameservers` | `any[]` |  |
| `registered` | `boolean` |  |
| `registrar` | `string` |  |
| `status` | `any[]` |  |
| `updated` | `string` |  |

#### Example: List

```ts
const whois = await client.Whoi().list()
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

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Module structure

```
kiprio-api-suite/
├── src/
│   ├── KiprioApiSuiteSDK.ts        # Main SDK class
│   ├── entity/             # Entity implementations
│   ├── feature/            # Built-in features (Base, Test, Log)
│   └── utility/            # Utility functions
├── test/                   # Test suites
└── dist/                   # Compiled output
```

Import the SDK from the package root:

```ts
import { KiprioApiSuiteSDK } from '@voxgig-sdk/kiprio-api-suite'
```

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const utility = client.Utility()
await utility.load()

// utility.data() now returns the utility data from the last `load`
// utility.match() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
