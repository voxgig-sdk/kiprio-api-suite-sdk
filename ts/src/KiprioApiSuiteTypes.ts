// Typed models for the KiprioApiSuite SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface DnsResult {
  domain?: string
  record?: Record<string, any>
}

export interface DnsResultLoadMatch {
  domain?: string
  record?: Record<string, any>
}

export interface Domain {
  agent?: Record<string, any>
  sitemap?: any[]
  url?: string
}

export interface DomainListMatch {
  agent?: Record<string, any>
  sitemap?: any[]
  url?: string
}

export interface EmailValidate {
  confidence?: number
  disposable?: boolean
  email?: string
  free_provider?: boolean
  mx_found?: boolean
  role_based?: boolean
  suggest?: string
  syntax_ok?: boolean
  valid?: boolean
}

export interface EmailValidateLoadMatch {
  confidence?: number
  disposable?: boolean
  email?: string
  free_provider?: boolean
  mx_found?: boolean
  role_based?: boolean
  suggest?: string
  syntax_ok?: boolean
  valid?: boolean
}

export interface Generate {
}

export interface GenerateLoadMatch {
}

export interface Grammar {
  correction?: any[]
  correction_count?: number
  language?: string
  text?: string
}

export interface GrammarCreateData {
  correction?: any[]
  correction_count?: number
  language?: string
  text?: string
}

export interface Ipn {
  asn?: string
  city?: string
  country?: string
  country_code?: string
  ip?: string
  latitude?: number
  longitude?: number
  org?: string
  timezone?: string
}

export interface IpnLoadMatch {
  asn?: string
  city?: string
  country?: string
  country_code?: string
  ip?: string
  latitude?: number
  longitude?: number
  org?: string
  timezone?: string
}

export interface Redact {
  count?: Record<string, any>
  entity?: any[]
  original_length?: number
  redact?: string
  redacted?: string
  text: string
}

export interface RedactCreateData {
  count?: Record<string, any>
  entity?: any[]
  original_length?: number
  redact?: string
  redacted?: string
  text: string
}

export interface Ssl {
  cipher?: string
  days_remaining?: number
  domain?: string
  expires_at?: string
  grade?: string
  issuer?: string
  protocol?: string
  san?: any[]
  subject?: string
  valid?: boolean
}

export interface SslListMatch {
  cipher?: string
  days_remaining?: number
  domain?: string
  expires_at?: string
  grade?: string
  issuer?: string
  protocol?: string
  san?: any[]
  subject?: string
  valid?: boolean
}

export interface Utility {
  algo?: string
  hash?: string
  input?: string
  length?: number
}

export interface UtilityLoadMatch {
  algo?: string
  hash?: string
  input?: string
  length?: number
}

export interface Whoi {
  created?: string
  domain?: string
  expire?: string
  nameserver?: any[]
  registered?: boolean
  registrar?: string
  status?: any[]
  updated?: string
}

export interface WhoiListMatch {
  created?: string
  domain?: string
  expire?: string
  nameserver?: any[]
  registered?: boolean
  registrar?: string
  status?: any[]
  updated?: string
}

