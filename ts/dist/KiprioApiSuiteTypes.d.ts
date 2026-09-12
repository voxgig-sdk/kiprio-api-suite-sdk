export interface DnsResult {
    domain?: string;
    records?: Record<string, any>;
}
export interface DnsResultLoadMatch {
    domain: string;
    type?: string;
}
export interface Domain {
    agents?: Record<string, any>;
    sitemaps?: any[];
    url?: string;
}
export interface DomainListMatch {
    url: string;
}
export interface EmailValidate {
    confidence?: number;
    disposable?: boolean;
    email?: string;
    free_provider?: boolean;
    mx_found?: boolean;
    role_based?: boolean;
    suggest?: string;
    syntax_ok?: boolean;
    valid?: boolean;
}
export interface EmailValidateLoadMatch {
    email: string;
}
export interface Generate {
}
export interface GenerateLoadMatch {
    bg?: string;
    ec_level?: string;
    fg?: string;
    format?: string;
    size?: number;
    url: string;
}
export interface Grammar {
    correction_count?: number;
    corrections?: any[];
    language?: string;
    text?: string;
}
export interface GrammarCreateData {
    correction_count?: number;
    corrections?: any[];
    language?: string;
    text?: string;
}
export interface Ipn {
    asn?: string;
    city?: string;
    country?: string;
    country_code?: string;
    ip?: string;
    latitude?: number;
    longitude?: number;
    org?: string;
    timezone?: string;
}
export interface IpnLoadMatch {
    ip?: string;
}
export interface Redact {
    counts?: Record<string, any>;
    entities?: any[];
    original_length?: number;
    redact?: string;
    redacted?: string;
    text: string;
}
export interface RedactCreateData {
    counts?: Record<string, any>;
    entities?: any[];
    original_length?: number;
    redact?: string;
    redacted?: string;
    text: string;
}
export interface Ssl {
    cipher?: string;
    days_remaining?: number;
    domain?: string;
    expires_at?: string;
    grade?: string;
    issuer?: string;
    protocol?: string;
    sans?: any[];
    subject?: string;
    valid?: boolean;
}
export interface SslListMatch {
    domain: string;
    port?: number;
}
export interface Utility {
    algo?: string;
    hash?: string;
    input?: string;
    length?: number;
}
export interface UtilityLoadMatch {
    algo?: string;
    input: string;
}
export interface Whoi {
    created?: string;
    domain?: string;
    expires?: string;
    nameservers?: any[];
    registered?: boolean;
    registrar?: string;
    status?: any[];
    updated?: string;
}
export interface WhoiListMatch {
    domain: string;
}
