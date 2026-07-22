# frozen_string_literal: true

# Typed models for the KiprioApiSuite SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# DnsResult entity data model.
#
# @!attribute [rw] domain
#   @return [String, nil]
#
# @!attribute [rw] record
#   @return [Hash, nil]
DnsResult = Struct.new(
  :domain,
  :record,
  keyword_init: true
)

# Request payload for DnsResult#load.
#
# @!attribute [rw] domain
#   @return [String, nil]
#
# @!attribute [rw] record
#   @return [Hash, nil]
DnsResultLoadMatch = Struct.new(
  :domain,
  :record,
  keyword_init: true
)

# Domain entity data model.
#
# @!attribute [rw] agent
#   @return [Hash, nil]
#
# @!attribute [rw] sitemap
#   @return [Array, nil]
#
# @!attribute [rw] url
#   @return [String, nil]
Domain = Struct.new(
  :agent,
  :sitemap,
  :url,
  keyword_init: true
)

# Request payload for Domain#list.
#
# @!attribute [rw] agent
#   @return [Hash, nil]
#
# @!attribute [rw] sitemap
#   @return [Array, nil]
#
# @!attribute [rw] url
#   @return [String, nil]
DomainListMatch = Struct.new(
  :agent,
  :sitemap,
  :url,
  keyword_init: true
)

# EmailValidate entity data model.
#
# @!attribute [rw] confidence
#   @return [Float, nil]
#
# @!attribute [rw] disposable
#   @return [Boolean, nil]
#
# @!attribute [rw] email
#   @return [String, nil]
#
# @!attribute [rw] free_provider
#   @return [Boolean, nil]
#
# @!attribute [rw] mx_found
#   @return [Boolean, nil]
#
# @!attribute [rw] role_based
#   @return [Boolean, nil]
#
# @!attribute [rw] suggest
#   @return [String, nil]
#
# @!attribute [rw] syntax_ok
#   @return [Boolean, nil]
#
# @!attribute [rw] valid
#   @return [Boolean, nil]
EmailValidate = Struct.new(
  :confidence,
  :disposable,
  :email,
  :free_provider,
  :mx_found,
  :role_based,
  :suggest,
  :syntax_ok,
  :valid,
  keyword_init: true
)

# Request payload for EmailValidate#load.
#
# @!attribute [rw] confidence
#   @return [Float, nil]
#
# @!attribute [rw] disposable
#   @return [Boolean, nil]
#
# @!attribute [rw] email
#   @return [String, nil]
#
# @!attribute [rw] free_provider
#   @return [Boolean, nil]
#
# @!attribute [rw] mx_found
#   @return [Boolean, nil]
#
# @!attribute [rw] role_based
#   @return [Boolean, nil]
#
# @!attribute [rw] suggest
#   @return [String, nil]
#
# @!attribute [rw] syntax_ok
#   @return [Boolean, nil]
#
# @!attribute [rw] valid
#   @return [Boolean, nil]
EmailValidateLoadMatch = Struct.new(
  :confidence,
  :disposable,
  :email,
  :free_provider,
  :mx_found,
  :role_based,
  :suggest,
  :syntax_ok,
  :valid,
  keyword_init: true
)

# Generate entity data model.
class Generate
end

# Request payload for Generate#load.
class GenerateLoadMatch
end

# Grammar entity data model.
#
# @!attribute [rw] correction
#   @return [Array, nil]
#
# @!attribute [rw] correction_count
#   @return [Integer, nil]
#
# @!attribute [rw] language
#   @return [String, nil]
#
# @!attribute [rw] text
#   @return [String, nil]
Grammar = Struct.new(
  :correction,
  :correction_count,
  :language,
  :text,
  keyword_init: true
)

# Request payload for Grammar#create.
#
# @!attribute [rw] correction
#   @return [Array, nil]
#
# @!attribute [rw] correction_count
#   @return [Integer, nil]
#
# @!attribute [rw] language
#   @return [String, nil]
#
# @!attribute [rw] text
#   @return [String, nil]
GrammarCreateData = Struct.new(
  :correction,
  :correction_count,
  :language,
  :text,
  keyword_init: true
)

# Ipn entity data model.
#
# @!attribute [rw] asn
#   @return [String, nil]
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] country
#   @return [String, nil]
#
# @!attribute [rw] country_code
#   @return [String, nil]
#
# @!attribute [rw] ip
#   @return [String, nil]
#
# @!attribute [rw] latitude
#   @return [Float, nil]
#
# @!attribute [rw] longitude
#   @return [Float, nil]
#
# @!attribute [rw] org
#   @return [String, nil]
#
# @!attribute [rw] timezone
#   @return [String, nil]
Ipn = Struct.new(
  :asn,
  :city,
  :country,
  :country_code,
  :ip,
  :latitude,
  :longitude,
  :org,
  :timezone,
  keyword_init: true
)

# Request payload for Ipn#load.
#
# @!attribute [rw] asn
#   @return [String, nil]
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] country
#   @return [String, nil]
#
# @!attribute [rw] country_code
#   @return [String, nil]
#
# @!attribute [rw] ip
#   @return [String, nil]
#
# @!attribute [rw] latitude
#   @return [Float, nil]
#
# @!attribute [rw] longitude
#   @return [Float, nil]
#
# @!attribute [rw] org
#   @return [String, nil]
#
# @!attribute [rw] timezone
#   @return [String, nil]
IpnLoadMatch = Struct.new(
  :asn,
  :city,
  :country,
  :country_code,
  :ip,
  :latitude,
  :longitude,
  :org,
  :timezone,
  keyword_init: true
)

# Redact entity data model.
#
# @!attribute [rw] count
#   @return [Hash, nil]
#
# @!attribute [rw] entity
#   @return [Array, nil]
#
# @!attribute [rw] original_length
#   @return [Integer, nil]
#
# @!attribute [rw] redact
#   @return [String, nil]
#
# @!attribute [rw] redacted
#   @return [String, nil]
#
# @!attribute [rw] text
#   @return [String]
Redact = Struct.new(
  :count,
  :entity,
  :original_length,
  :redact,
  :redacted,
  :text,
  keyword_init: true
)

# Request payload for Redact#create.
#
# @!attribute [rw] count
#   @return [Hash, nil]
#
# @!attribute [rw] entity
#   @return [Array, nil]
#
# @!attribute [rw] original_length
#   @return [Integer, nil]
#
# @!attribute [rw] redact
#   @return [String, nil]
#
# @!attribute [rw] redacted
#   @return [String, nil]
#
# @!attribute [rw] text
#   @return [String]
RedactCreateData = Struct.new(
  :count,
  :entity,
  :original_length,
  :redact,
  :redacted,
  :text,
  keyword_init: true
)

# Ssl entity data model.
#
# @!attribute [rw] cipher
#   @return [String, nil]
#
# @!attribute [rw] days_remaining
#   @return [Integer, nil]
#
# @!attribute [rw] domain
#   @return [String, nil]
#
# @!attribute [rw] expires_at
#   @return [String, nil]
#
# @!attribute [rw] grade
#   @return [String, nil]
#
# @!attribute [rw] issuer
#   @return [String, nil]
#
# @!attribute [rw] protocol
#   @return [String, nil]
#
# @!attribute [rw] san
#   @return [Array, nil]
#
# @!attribute [rw] subject
#   @return [String, nil]
#
# @!attribute [rw] valid
#   @return [Boolean, nil]
Ssl = Struct.new(
  :cipher,
  :days_remaining,
  :domain,
  :expires_at,
  :grade,
  :issuer,
  :protocol,
  :san,
  :subject,
  :valid,
  keyword_init: true
)

# Request payload for Ssl#list.
#
# @!attribute [rw] cipher
#   @return [String, nil]
#
# @!attribute [rw] days_remaining
#   @return [Integer, nil]
#
# @!attribute [rw] domain
#   @return [String, nil]
#
# @!attribute [rw] expires_at
#   @return [String, nil]
#
# @!attribute [rw] grade
#   @return [String, nil]
#
# @!attribute [rw] issuer
#   @return [String, nil]
#
# @!attribute [rw] protocol
#   @return [String, nil]
#
# @!attribute [rw] san
#   @return [Array, nil]
#
# @!attribute [rw] subject
#   @return [String, nil]
#
# @!attribute [rw] valid
#   @return [Boolean, nil]
SslListMatch = Struct.new(
  :cipher,
  :days_remaining,
  :domain,
  :expires_at,
  :grade,
  :issuer,
  :protocol,
  :san,
  :subject,
  :valid,
  keyword_init: true
)

# Utility entity data model.
#
# @!attribute [rw] algo
#   @return [String, nil]
#
# @!attribute [rw] hash
#   @return [String, nil]
#
# @!attribute [rw] input
#   @return [String, nil]
#
# @!attribute [rw] length
#   @return [Integer, nil]
Utility = Struct.new(
  :algo,
  :hash,
  :input,
  :length,
  keyword_init: true
)

# Request payload for Utility#load.
#
# @!attribute [rw] algo
#   @return [String, nil]
#
# @!attribute [rw] hash
#   @return [String, nil]
#
# @!attribute [rw] input
#   @return [String, nil]
#
# @!attribute [rw] length
#   @return [Integer, nil]
UtilityLoadMatch = Struct.new(
  :algo,
  :hash,
  :input,
  :length,
  keyword_init: true
)

# Whoi entity data model.
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] domain
#   @return [String, nil]
#
# @!attribute [rw] expire
#   @return [String, nil]
#
# @!attribute [rw] nameserver
#   @return [Array, nil]
#
# @!attribute [rw] registered
#   @return [Boolean, nil]
#
# @!attribute [rw] registrar
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [Array, nil]
#
# @!attribute [rw] updated
#   @return [String, nil]
Whoi = Struct.new(
  :created,
  :domain,
  :expire,
  :nameserver,
  :registered,
  :registrar,
  :status,
  :updated,
  keyword_init: true
)

# Request payload for Whoi#list.
#
# @!attribute [rw] created
#   @return [String, nil]
#
# @!attribute [rw] domain
#   @return [String, nil]
#
# @!attribute [rw] expire
#   @return [String, nil]
#
# @!attribute [rw] nameserver
#   @return [Array, nil]
#
# @!attribute [rw] registered
#   @return [Boolean, nil]
#
# @!attribute [rw] registrar
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [Array, nil]
#
# @!attribute [rw] updated
#   @return [String, nil]
WhoiListMatch = Struct.new(
  :created,
  :domain,
  :expire,
  :nameserver,
  :registered,
  :registrar,
  :status,
  :updated,
  keyword_init: true
)

