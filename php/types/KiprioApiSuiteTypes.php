<?php
declare(strict_types=1);

// Typed models for the KiprioApiSuite SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** DnsResult entity data model. */
class DnsResult
{
    public ?string $domain = null;
    public ?array $record = null;
}

/** Request payload for DnsResult#load. */
class DnsResultLoadMatch
{
    public ?string $domain = null;
    public ?array $record = null;
}

/** Domain entity data model. */
class Domain
{
    public ?array $agent = null;
    public ?array $sitemap = null;
    public ?string $url = null;
}

/** Request payload for Domain#list. */
class DomainListMatch
{
    public ?array $agent = null;
    public ?array $sitemap = null;
    public ?string $url = null;
}

/** EmailValidate entity data model. */
class EmailValidate
{
    public ?float $confidence = null;
    public ?bool $disposable = null;
    public ?string $email = null;
    public ?bool $free_provider = null;
    public ?bool $mx_found = null;
    public ?bool $role_based = null;
    public ?string $suggest = null;
    public ?bool $syntax_ok = null;
    public ?bool $valid = null;
}

/** Request payload for EmailValidate#load. */
class EmailValidateLoadMatch
{
    public ?float $confidence = null;
    public ?bool $disposable = null;
    public ?string $email = null;
    public ?bool $free_provider = null;
    public ?bool $mx_found = null;
    public ?bool $role_based = null;
    public ?string $suggest = null;
    public ?bool $syntax_ok = null;
    public ?bool $valid = null;
}

/** Generate entity data model. */
class Generate
{
}

/** Request payload for Generate#load. */
class GenerateLoadMatch
{
}

/** Grammar entity data model. */
class Grammar
{
    public ?array $correction = null;
    public ?int $correction_count = null;
    public ?string $language = null;
    public ?string $text = null;
}

/** Request payload for Grammar#create. */
class GrammarCreateData
{
    public ?array $correction = null;
    public ?int $correction_count = null;
    public ?string $language = null;
    public ?string $text = null;
}

/** Ipn entity data model. */
class Ipn
{
    public ?string $asn = null;
    public ?string $city = null;
    public ?string $country = null;
    public ?string $country_code = null;
    public ?string $ip = null;
    public ?float $latitude = null;
    public ?float $longitude = null;
    public ?string $org = null;
    public ?string $timezone = null;
}

/** Request payload for Ipn#load. */
class IpnLoadMatch
{
    public ?string $asn = null;
    public ?string $city = null;
    public ?string $country = null;
    public ?string $country_code = null;
    public ?string $ip = null;
    public ?float $latitude = null;
    public ?float $longitude = null;
    public ?string $org = null;
    public ?string $timezone = null;
}

/** Redact entity data model. */
class Redact
{
    public ?array $count = null;
    public ?array $entity = null;
    public ?int $original_length = null;
    public ?string $redact = null;
    public ?string $redacted = null;
    public string $text;
}

/** Request payload for Redact#create. */
class RedactCreateData
{
    public ?array $count = null;
    public ?array $entity = null;
    public ?int $original_length = null;
    public ?string $redact = null;
    public ?string $redacted = null;
    public string $text;
}

/** Ssl entity data model. */
class Ssl
{
    public ?string $cipher = null;
    public ?int $days_remaining = null;
    public ?string $domain = null;
    public ?string $expires_at = null;
    public ?string $grade = null;
    public ?string $issuer = null;
    public ?string $protocol = null;
    public ?array $san = null;
    public ?string $subject = null;
    public ?bool $valid = null;
}

/** Request payload for Ssl#list. */
class SslListMatch
{
    public ?string $cipher = null;
    public ?int $days_remaining = null;
    public ?string $domain = null;
    public ?string $expires_at = null;
    public ?string $grade = null;
    public ?string $issuer = null;
    public ?string $protocol = null;
    public ?array $san = null;
    public ?string $subject = null;
    public ?bool $valid = null;
}

/** Utility entity data model. */
class Utility
{
    public ?string $algo = null;
    public ?string $hash = null;
    public ?string $input = null;
    public ?int $length = null;
}

/** Request payload for Utility#load. */
class UtilityLoadMatch
{
    public ?string $algo = null;
    public ?string $hash = null;
    public ?string $input = null;
    public ?int $length = null;
}

/** Whoi entity data model. */
class Whoi
{
    public ?string $created = null;
    public ?string $domain = null;
    public ?string $expire = null;
    public ?array $nameserver = null;
    public ?bool $registered = null;
    public ?string $registrar = null;
    public ?array $status = null;
    public ?string $updated = null;
}

/** Request payload for Whoi#list. */
class WhoiListMatch
{
    public ?string $created = null;
    public ?string $domain = null;
    public ?string $expire = null;
    public ?array $nameserver = null;
    public ?bool $registered = null;
    public ?string $registrar = null;
    public ?array $status = null;
    public ?string $updated = null;
}

