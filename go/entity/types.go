// Typed models for the KiprioApiSuite SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import (
	"encoding/json"

	"github.com/voxgig-sdk/kiprio-api-suite-sdk/go/core"
)

// DnsResult is the typed data model for the dns_result entity.
type DnsResult struct {
	Domain *string `json:"domain,omitempty"`
	Records *map[string]any `json:"records,omitempty"`
}

// DnsResultLoadMatch is the typed request payload for DnsResult.LoadTyped.
type DnsResultLoadMatch struct {
	Domain *string `json:"domain,omitempty"`
	Records *map[string]any `json:"records,omitempty"`
}

// Domain is the typed data model for the domain entity.
type Domain struct {
	Agents *map[string]any `json:"agents,omitempty"`
	Sitemaps *[]any `json:"sitemaps,omitempty"`
	Url *string `json:"url,omitempty"`
}

// DomainListMatch is the typed request payload for Domain.ListTyped.
type DomainListMatch struct {
	Agents *map[string]any `json:"agents,omitempty"`
	Sitemaps *[]any `json:"sitemaps,omitempty"`
	Url *string `json:"url,omitempty"`
}

// EmailValidate is the typed data model for the email_validate entity.
type EmailValidate struct {
	Confidence *float64 `json:"confidence,omitempty"`
	Disposable *bool `json:"disposable,omitempty"`
	Email *string `json:"email,omitempty"`
	FreeProvider *bool `json:"free_provider,omitempty"`
	MxFound *bool `json:"mx_found,omitempty"`
	RoleBased *bool `json:"role_based,omitempty"`
	Suggest *string `json:"suggest,omitempty"`
	SyntaxOk *bool `json:"syntax_ok,omitempty"`
	Valid *bool `json:"valid,omitempty"`
}

// EmailValidateLoadMatch is the typed request payload for EmailValidate.LoadTyped.
type EmailValidateLoadMatch struct {
	Confidence *float64 `json:"confidence,omitempty"`
	Disposable *bool `json:"disposable,omitempty"`
	Email *string `json:"email,omitempty"`
	FreeProvider *bool `json:"free_provider,omitempty"`
	MxFound *bool `json:"mx_found,omitempty"`
	RoleBased *bool `json:"role_based,omitempty"`
	Suggest *string `json:"suggest,omitempty"`
	SyntaxOk *bool `json:"syntax_ok,omitempty"`
	Valid *bool `json:"valid,omitempty"`
}

// Generate is the typed data model for the generate entity.
type Generate struct {
}

// GenerateLoadMatch is the typed request payload for Generate.LoadTyped.
type GenerateLoadMatch struct {
}

// Grammar is the typed data model for the grammar entity.
type Grammar struct {
	CorrectionCount *int `json:"correction_count,omitempty"`
	Corrections *[]any `json:"corrections,omitempty"`
	Language *string `json:"language,omitempty"`
	Text *string `json:"text,omitempty"`
}

// GrammarCreateData is the typed request payload for Grammar.CreateTyped.
type GrammarCreateData struct {
	CorrectionCount *int `json:"correction_count,omitempty"`
	Corrections *[]any `json:"corrections,omitempty"`
	Language *string `json:"language,omitempty"`
	Text *string `json:"text,omitempty"`
}

// Ipn is the typed data model for the ipn entity.
type Ipn struct {
	Asn *string `json:"asn,omitempty"`
	City *string `json:"city,omitempty"`
	Country *string `json:"country,omitempty"`
	CountryCode *string `json:"country_code,omitempty"`
	Ip *string `json:"ip,omitempty"`
	Latitude *float64 `json:"latitude,omitempty"`
	Longitude *float64 `json:"longitude,omitempty"`
	Org *string `json:"org,omitempty"`
	Timezone *string `json:"timezone,omitempty"`
}

// IpnLoadMatch is the typed request payload for Ipn.LoadTyped.
type IpnLoadMatch struct {
	Asn *string `json:"asn,omitempty"`
	City *string `json:"city,omitempty"`
	Country *string `json:"country,omitempty"`
	CountryCode *string `json:"country_code,omitempty"`
	Ip *string `json:"ip,omitempty"`
	Latitude *float64 `json:"latitude,omitempty"`
	Longitude *float64 `json:"longitude,omitempty"`
	Org *string `json:"org,omitempty"`
	Timezone *string `json:"timezone,omitempty"`
}

// Redact is the typed data model for the redact entity.
type Redact struct {
	Counts *map[string]any `json:"counts,omitempty"`
	Entities *[]any `json:"entities,omitempty"`
	OriginalLength *int `json:"original_length,omitempty"`
	Redact *string `json:"redact,omitempty"`
	Redacted *string `json:"redacted,omitempty"`
	Text string `json:"text"`
}

// RedactCreateData is the typed request payload for Redact.CreateTyped.
type RedactCreateData struct {
	Counts *map[string]any `json:"counts,omitempty"`
	Entities *[]any `json:"entities,omitempty"`
	OriginalLength *int `json:"original_length,omitempty"`
	Redact *string `json:"redact,omitempty"`
	Redacted *string `json:"redacted,omitempty"`
	Text string `json:"text"`
}

// Ssl is the typed data model for the ssl entity.
type Ssl struct {
	Cipher *string `json:"cipher,omitempty"`
	DaysRemaining *int `json:"days_remaining,omitempty"`
	Domain *string `json:"domain,omitempty"`
	ExpiresAt *string `json:"expires_at,omitempty"`
	Grade *string `json:"grade,omitempty"`
	Issuer *string `json:"issuer,omitempty"`
	Protocol *string `json:"protocol,omitempty"`
	Sans *[]any `json:"sans,omitempty"`
	Subject *string `json:"subject,omitempty"`
	Valid *bool `json:"valid,omitempty"`
}

// SslListMatch is the typed request payload for Ssl.ListTyped.
type SslListMatch struct {
	Cipher *string `json:"cipher,omitempty"`
	DaysRemaining *int `json:"days_remaining,omitempty"`
	Domain *string `json:"domain,omitempty"`
	ExpiresAt *string `json:"expires_at,omitempty"`
	Grade *string `json:"grade,omitempty"`
	Issuer *string `json:"issuer,omitempty"`
	Protocol *string `json:"protocol,omitempty"`
	Sans *[]any `json:"sans,omitempty"`
	Subject *string `json:"subject,omitempty"`
	Valid *bool `json:"valid,omitempty"`
}

// Utility is the typed data model for the utility entity.
type Utility struct {
	Algo *string `json:"algo,omitempty"`
	Hash *string `json:"hash,omitempty"`
	Input *string `json:"input,omitempty"`
	Length *int `json:"length,omitempty"`
}

// UtilityLoadMatch is the typed request payload for Utility.LoadTyped.
type UtilityLoadMatch struct {
	Algo *string `json:"algo,omitempty"`
	Hash *string `json:"hash,omitempty"`
	Input *string `json:"input,omitempty"`
	Length *int `json:"length,omitempty"`
}

// Whoi is the typed data model for the whoi entity.
type Whoi struct {
	Created *string `json:"created,omitempty"`
	Domain *string `json:"domain,omitempty"`
	Expires *string `json:"expires,omitempty"`
	Nameservers *[]any `json:"nameservers,omitempty"`
	Registered *bool `json:"registered,omitempty"`
	Registrar *string `json:"registrar,omitempty"`
	Status *[]any `json:"status,omitempty"`
	Updated *string `json:"updated,omitempty"`
}

// WhoiListMatch is the typed request payload for Whoi.ListTyped.
type WhoiListMatch struct {
	Created *string `json:"created,omitempty"`
	Domain *string `json:"domain,omitempty"`
	Expires *string `json:"expires,omitempty"`
	Nameservers *[]any `json:"nameservers,omitempty"`
	Registered *bool `json:"registered,omitempty"`
	Registrar *string `json:"registrar,omitempty"`
	Status *[]any `json:"status,omitempty"`
	Updated *string `json:"updated,omitempty"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// entityData unwraps an entity to its data map.
//
// Operations resolve to the ENTITY, not the raw data (see AGENTS.md), and an
// entity's fields are UNEXPORTED — marshalling one directly yields `{}`, so
// every typed accessor would silently hand back a zero-valued struct. The
// typed boundary therefore takes the data hop first.
func entityData(v any) any {
	if ent, ok := v.(core.Entity); ok {
		return ent.Data()
	}
	return v
}

// typedFrom decodes a runtime value (an entity, or the map[string]any the op
// pipeline produced) into a typed model T via a JSON round-trip. On any error
// it returns the zero value of T; the op's own (value, error) tuple carries
// the real error.
func typedFrom[T any](v any) T {
	var out T
	v = entityData(v)
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value into a typed slice []T via a
// JSON round-trip, for list ops. `list` resolves to a slice of ENTITY
// instances, so each element takes the data hop.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	if list, ok := v.([]any); ok {
		unwrapped := make([]any, 0, len(list))
		for _, item := range list {
			unwrapped = append(unwrapped, entityData(item))
		}
		v = unwrapped
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
