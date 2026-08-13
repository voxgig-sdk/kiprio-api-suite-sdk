-- Typed models for the KiprioApiSuite SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class DnsResult
---@field domain? string
---@field records? table

---@class DnsResultLoadMatch
---@field domain? string
---@field records? table

---@class Domain
---@field agents? table
---@field sitemaps? table
---@field url? string

---@class DomainListMatch
---@field agents? table
---@field sitemaps? table
---@field url? string

---@class EmailValidate
---@field confidence? number
---@field disposable? boolean
---@field email? string
---@field free_provider? boolean
---@field mx_found? boolean
---@field role_based? boolean
---@field suggest? string
---@field syntax_ok? boolean
---@field valid? boolean

---@class EmailValidateLoadMatch
---@field confidence? number
---@field disposable? boolean
---@field email? string
---@field free_provider? boolean
---@field mx_found? boolean
---@field role_based? boolean
---@field suggest? string
---@field syntax_ok? boolean
---@field valid? boolean

---@class Generate

---@class GenerateLoadMatch

---@class Grammar
---@field correction_count? number
---@field corrections? table
---@field language? string
---@field text? string

---@class GrammarCreateData
---@field correction_count? number
---@field corrections? table
---@field language? string
---@field text? string

---@class Ipn
---@field asn? string
---@field city? string
---@field country? string
---@field country_code? string
---@field ip? string
---@field latitude? number
---@field longitude? number
---@field org? string
---@field timezone? string

---@class IpnLoadMatch
---@field asn? string
---@field city? string
---@field country? string
---@field country_code? string
---@field ip? string
---@field latitude? number
---@field longitude? number
---@field org? string
---@field timezone? string

---@class Redact
---@field counts? table
---@field entities? table
---@field original_length? number
---@field redact? string
---@field redacted? string
---@field text string

---@class RedactCreateData
---@field counts? table
---@field entities? table
---@field original_length? number
---@field redact? string
---@field redacted? string
---@field text string

---@class Ssl
---@field cipher? string
---@field days_remaining? number
---@field domain? string
---@field expires_at? string
---@field grade? string
---@field issuer? string
---@field protocol? string
---@field sans? table
---@field subject? string
---@field valid? boolean

---@class SslListMatch
---@field cipher? string
---@field days_remaining? number
---@field domain? string
---@field expires_at? string
---@field grade? string
---@field issuer? string
---@field protocol? string
---@field sans? table
---@field subject? string
---@field valid? boolean

---@class Utility
---@field algo? string
---@field hash? string
---@field input? string
---@field length? number

---@class UtilityLoadMatch
---@field algo? string
---@field hash? string
---@field input? string
---@field length? number

---@class Whoi
---@field created? string
---@field domain? string
---@field expires? string
---@field nameservers? table
---@field registered? boolean
---@field registrar? string
---@field status? table
---@field updated? string

---@class WhoiListMatch
---@field created? string
---@field domain? string
---@field expires? string
---@field nameservers? table
---@field registered? boolean
---@field registrar? string
---@field status? table
---@field updated? string

local M = {}

return M
