package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "KiprioApiSuite",
			"slug": "kiprio-api-suite",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
			},
		},
		"options": map[string]any{
			"base": "https://kiprio.com/v1",
			"auth": map[string]any{
				"prefix": "",
			},
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"dns_result": map[string]any{},
				"domain": map[string]any{},
				"email_validate": map[string]any{},
				"generate": map[string]any{},
				"grammar": map[string]any{},
				"ipn": map[string]any{},
				"redact": map[string]any{},
				"ssl": map[string]any{},
				"utility": map[string]any{},
				"whoi": map[string]any{},
			},
		},
		"entity": map[string]any{
			"dns_result": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "domain",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "records",
						"type": "`$OBJECT`",
					},
				},
				"name": "dns_result",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": "example.com",
											"kind": "query",
											"name": "domain",
											"orig": "domain",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "A,MX,TXT",
											"kind": "query",
											"name": "type",
											"orig": "type",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/dns-lookup",
								"parts": []any{
									"dns-lookup",
								},
								"select": map[string]any{
									"exist": []any{
										"domain",
										"type",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.records`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"domain": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "agents",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "sitemaps",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "url",
						"type": "`$STRING`",
					},
				},
				"name": "domain",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": "https://example.com",
											"kind": "query",
											"name": "url",
											"orig": "url",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/robots-txt",
								"parts": []any{
									"robots-txt",
								},
								"select": map[string]any{
									"exist": []any{
										"url",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"email_validate": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "confidence",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "disposable",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "email",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "free_provider",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "mx_found",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "role_based",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "suggest",
						"short": "Suggested correction for typos",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "syntax_ok",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "valid",
						"type": "`$BOOLEAN`",
					},
				},
				"name": "email_validate",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": "user@example.com",
											"kind": "query",
											"name": "email",
											"orig": "email",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/email-validate",
								"parts": []any{
									"email-validate",
								},
								"select": map[string]any{
									"exist": []any{
										"email",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"generate": map[string]any{
				"fields": []any{},
				"name": "generate",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": "#ffffff",
											"kind": "query",
											"name": "bg",
											"orig": "bg",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "M",
											"kind": "query",
											"name": "ec_level",
											"orig": "ec_level",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "#000000",
											"kind": "query",
											"name": "fg",
											"orig": "fg",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "png",
											"kind": "query",
											"name": "format",
											"orig": "format",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 512,
											"kind": "query",
											"name": "size",
											"orig": "size",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "https://example.com",
											"kind": "query",
											"name": "url",
											"orig": "url",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/qr",
								"parts": []any{
									"qr",
								},
								"select": map[string]any{
									"exist": []any{
										"bg",
										"ec_level",
										"fg",
										"format",
										"size",
										"url",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": "HELLO123",
											"kind": "query",
											"name": "data",
											"orig": "data",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "code128",
											"kind": "query",
											"name": "format",
											"orig": "format",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 120,
											"kind": "query",
											"name": "height",
											"orig": "height",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": "svg",
											"kind": "query",
											"name": "output",
											"orig": "output",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 400,
											"kind": "query",
											"name": "width",
											"orig": "width",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/barcode",
								"parts": []any{
									"barcode",
								},
								"select": map[string]any{
									"exist": []any{
										"data",
										"format",
										"height",
										"output",
										"width",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": true,
											"kind": "query",
											"name": "full_page",
											"orig": "full_page",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"example": "https://example.com",
											"kind": "query",
											"name": "url",
											"orig": "url",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 1280,
											"kind": "query",
											"name": "width",
											"orig": "width",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/screenshot",
								"parts": []any{
									"screenshot",
								},
								"select": map[string]any{
									"exist": []any{
										"full_page",
										"url",
										"width",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"grammar": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "correction_count",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "corrections",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "language",
						"short": "BCP 47 language tag",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "text",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$STRING`",
							},
						},
						"short": "Text to check",
						"type": "`$STRING`",
					},
				},
				"name": "grammar",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/grammar",
								"parts": []any{
									"grammar",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"ipn": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "asn",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "city",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "country",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "country_code",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "ip",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "latitude",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "longitude",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "org",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "timezone",
						"type": "`$STRING`",
					},
				},
				"name": "ipn",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": "8.8.8.8",
											"kind": "query",
											"name": "ip",
											"orig": "ip",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/ip",
								"parts": []any{
									"ip",
								},
								"select": map[string]any{
									"exist": []any{
										"ip",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"redact": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "counts",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "entities",
						"short": "Include detected entity positions in response",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "original_length",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "redact",
						"short": "Comma-separated PII types to redact.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "redacted",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "text",
						"req": true,
						"short": "Text to redact",
						"type": "`$STRING`",
					},
				},
				"name": "redact",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "POST",
								"orig": "/redact",
								"parts": []any{
									"redact",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": map[string]any{
										"redact": "`reqdata`",
									},
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"ssl": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "cipher",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "days_remaining",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "domain",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "expires_at",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "grade",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "issuer",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "protocol",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "sans",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "subject",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "valid",
						"type": "`$BOOLEAN`",
					},
				},
				"name": "ssl",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": "example.com",
											"kind": "query",
											"name": "domain",
											"orig": "domain",
											"reqd": true,
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 443,
											"kind": "query",
											"name": "port",
											"orig": "port",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/ssl",
								"parts": []any{
									"ssl",
								},
								"select": map[string]any{
									"exist": []any{
										"domain",
										"port",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.sans`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"utility": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "algo",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "hash",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "input",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "length",
						"type": "`$INTEGER`",
					},
				},
				"name": "utility",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": "sha256",
											"kind": "query",
											"name": "algo",
											"orig": "algo",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "hello world",
											"kind": "query",
											"name": "input",
											"orig": "input",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/hash",
								"parts": []any{
									"hash",
								},
								"select": map[string]any{
									"exist": []any{
										"algo",
										"input",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"whoi": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "created",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "domain",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "expires",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "nameservers",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "registered",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "registrar",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "status",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "updated",
						"type": "`$STRING`",
					},
				},
				"name": "whoi",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": "example.com",
											"kind": "query",
											"name": "domain",
											"orig": "domain",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/whois",
								"parts": []any{
									"whois",
								},
								"select": map[string]any{
									"exist": []any{
										"domain",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
