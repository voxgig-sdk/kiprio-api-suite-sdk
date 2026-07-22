# Typed models for the KiprioApiSuite SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class DnsResult(TypedDict, total=False):
    domain: str
    record: dict


class DnsResultLoadMatch(TypedDict, total=False):
    domain: str
    record: dict


class Domain(TypedDict, total=False):
    agent: dict
    sitemap: list
    url: str


class DomainListMatch(TypedDict, total=False):
    agent: dict
    sitemap: list
    url: str


class EmailValidate(TypedDict, total=False):
    confidence: float
    disposable: bool
    email: str
    free_provider: bool
    mx_found: bool
    role_based: bool
    suggest: str
    syntax_ok: bool
    valid: bool


class EmailValidateLoadMatch(TypedDict, total=False):
    confidence: float
    disposable: bool
    email: str
    free_provider: bool
    mx_found: bool
    role_based: bool
    suggest: str
    syntax_ok: bool
    valid: bool


class Generate(TypedDict):
    pass


class GenerateLoadMatch(TypedDict):
    pass


class Grammar(TypedDict, total=False):
    correction: list
    correction_count: int
    language: str
    text: str


class GrammarCreateData(TypedDict, total=False):
    correction: list
    correction_count: int
    language: str
    text: str


class Ipn(TypedDict, total=False):
    asn: str
    city: str
    country: str
    country_code: str
    ip: str
    latitude: float
    longitude: float
    org: str
    timezone: str


class IpnLoadMatch(TypedDict, total=False):
    asn: str
    city: str
    country: str
    country_code: str
    ip: str
    latitude: float
    longitude: float
    org: str
    timezone: str


class RedactRequired(TypedDict):
    text: str


class Redact(RedactRequired, total=False):
    count: dict
    entity: list
    original_length: int
    redact: str
    redacted: str


class RedactCreateDataRequired(TypedDict):
    text: str


class RedactCreateData(RedactCreateDataRequired, total=False):
    count: dict
    entity: list
    original_length: int
    redact: str
    redacted: str


class Ssl(TypedDict, total=False):
    cipher: str
    days_remaining: int
    domain: str
    expires_at: str
    grade: str
    issuer: str
    protocol: str
    san: list
    subject: str
    valid: bool


class SslListMatch(TypedDict, total=False):
    cipher: str
    days_remaining: int
    domain: str
    expires_at: str
    grade: str
    issuer: str
    protocol: str
    san: list
    subject: str
    valid: bool


class Utility(TypedDict, total=False):
    algo: str
    hash: str
    input: str
    length: int


class UtilityLoadMatch(TypedDict, total=False):
    algo: str
    hash: str
    input: str
    length: int


class Whoi(TypedDict, total=False):
    created: str
    domain: str
    expire: str
    nameserver: list
    registered: bool
    registrar: str
    status: list
    updated: str


class WhoiListMatch(TypedDict, total=False):
    created: str
    domain: str
    expire: str
    nameserver: list
    registered: bool
    registrar: str
    status: list
    updated: str
