# KiprioApiSuite Python SDK Reference

Complete API reference for the KiprioApiSuite Python SDK.


## KiprioApiSuiteSDK

### Constructor

```python
from kiprioapisuite_sdk import KiprioApiSuiteSDK

client = KiprioApiSuiteSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["apikey"]` | `str` | API key for authentication. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `KiprioApiSuiteSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = KiprioApiSuiteSDK.test()
```


### Instance Methods

#### `DnsResult(data=None)`

Create a new `DnsResultEntity` instance. Pass `None` for no initial data.

#### `Domain(data=None)`

Create a new `DomainEntity` instance. Pass `None` for no initial data.

#### `EmailValidate(data=None)`

Create a new `EmailValidateEntity` instance. Pass `None` for no initial data.

#### `Generate(data=None)`

Create a new `GenerateEntity` instance. Pass `None` for no initial data.

#### `Grammar(data=None)`

Create a new `GrammarEntity` instance. Pass `None` for no initial data.

#### `Ipn(data=None)`

Create a new `IpnEntity` instance. Pass `None` for no initial data.

#### `Redact(data=None)`

Create a new `RedactEntity` instance. Pass `None` for no initial data.

#### `Ssl(data=None)`

Create a new `SslEntity` instance. Pass `None` for no initial data.

#### `Utility(data=None)`

Create a new `UtilityEntity` instance. Pass `None` for no initial data.

#### `Whoi(data=None)`

Create a new `WhoiEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## DnsResultEntity

```python
dns_result = client.DnsResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `str` | No |  |
| `records` | `dict` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.DnsResult().load()
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DnsResultEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## DomainEntity

```python
domain = client.Domain()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `agents` | `dict` | No |  |
| `sitemaps` | `list` | No |  |
| `url` | `str` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Domain().list()
for domain in results:
    print(domain)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DomainEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## EmailValidateEntity

```python
email_validate = client.EmailValidate()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `confidence` | `float` | No |  |
| `disposable` | `bool` | No |  |
| `email` | `str` | No |  |
| `free_provider` | `bool` | No |  |
| `mx_found` | `bool` | No |  |
| `role_based` | `bool` | No |  |
| `suggest` | `str` | No |  |
| `syntax_ok` | `bool` | No |  |
| `valid` | `bool` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.EmailValidate().load()
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `EmailValidateEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## GenerateEntity

```python
generate = client.Generate()
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Generate().load()
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `GenerateEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## GrammarEntity

```python
grammar = client.Grammar()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `correction_count` | `int` | No |  |
| `corrections` | `list` | No |  |
| `language` | `str` | No |  |
| `text` | `str` | No |  |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `correction_count` | - |
| `corrections` | - |
| `language` | - |
| `text` | Yes |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Grammar().create({
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `GrammarEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## IpnEntity

```python
ipn = client.Ipn()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `asn` | `str` | No |  |
| `city` | `str` | No |  |
| `country` | `str` | No |  |
| `country_code` | `str` | No |  |
| `ip` | `str` | No |  |
| `latitude` | `float` | No |  |
| `longitude` | `float` | No |  |
| `org` | `str` | No |  |
| `timezone` | `str` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Ipn().load()
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `IpnEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## RedactEntity

```python
redact = client.Redact()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `counts` | `dict` | No |  |
| `entities` | `list` | No |  |
| `original_length` | `int` | No |  |
| `redact` | `str` | No |  |
| `redacted` | `str` | No |  |
| `text` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Redact().create({
    "text": "example_text",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `RedactEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## SslEntity

```python
ssl = client.Ssl()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `cipher` | `str` | No |  |
| `days_remaining` | `int` | No |  |
| `domain` | `str` | No |  |
| `expires_at` | `str` | No |  |
| `grade` | `str` | No |  |
| `issuer` | `str` | No |  |
| `protocol` | `str` | No |  |
| `sans` | `list` | No |  |
| `subject` | `str` | No |  |
| `valid` | `bool` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Ssl().list()
for ssl in results:
    print(ssl)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SslEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## UtilityEntity

```python
utility = client.Utility()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `algo` | `str` | No |  |
| `hash` | `str` | No |  |
| `input` | `str` | No |  |
| `length` | `int` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Utility().load()
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `UtilityEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## WhoiEntity

```python
whoi = client.Whoi()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `str` | No |  |
| `domain` | `str` | No |  |
| `expires` | `str` | No |  |
| `nameservers` | `list` | No |  |
| `registered` | `bool` | No |  |
| `registrar` | `str` | No |  |
| `status` | `list` | No |  |
| `updated` | `str` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Whoi().list()
for whoi in results:
    print(whoi)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `WhoiEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = KiprioApiSuiteSDK({
    "feature": {
        "test": {"active": True},
    },
})
```

