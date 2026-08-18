-- KiprioApiSuite SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "KiprioApiSuite",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://kiprio.com/v1",
      auth = {
        prefix = "",
      },
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["dns_result"] = {},
        ["domain"] = {},
        ["email_validate"] = {},
        ["generate"] = {},
        ["grammar"] = {},
        ["ipn"] = {},
        ["redact"] = {},
        ["ssl"] = {},
        ["utility"] = {},
        ["whoi"] = {},
      },
    },
    entity = {
      ["dns_result"] = {
        ["fields"] = {
          {
            ["name"] = "domain",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "records",
            ["type"] = "`$OBJECT`",
          },
        },
        ["name"] = "dns_result",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["example"] = "example.com",
                      ["kind"] = "query",
                      ["name"] = "domain",
                      ["orig"] = "domain",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "A,MX,TXT",
                      ["kind"] = "query",
                      ["name"] = "type",
                      ["orig"] = "type",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/dns-lookup",
                ["parts"] = {
                  "dns-lookup",
                },
                ["select"] = {
                  ["exist"] = {
                    "domain",
                    "type",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.records`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["domain"] = {
        ["fields"] = {
          {
            ["name"] = "agents",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "sitemaps",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "url",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "domain",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["example"] = "https://example.com",
                      ["kind"] = "query",
                      ["name"] = "url",
                      ["orig"] = "url",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/robots-txt",
                ["parts"] = {
                  "robots-txt",
                },
                ["select"] = {
                  ["exist"] = {
                    "url",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["email_validate"] = {
        ["fields"] = {
          {
            ["name"] = "confidence",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "disposable",
            ["type"] = "`$BOOLEAN`",
          },
          {
            ["name"] = "email",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "free_provider",
            ["type"] = "`$BOOLEAN`",
          },
          {
            ["name"] = "mx_found",
            ["type"] = "`$BOOLEAN`",
          },
          {
            ["name"] = "role_based",
            ["type"] = "`$BOOLEAN`",
          },
          {
            ["name"] = "suggest",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "syntax_ok",
            ["type"] = "`$BOOLEAN`",
          },
          {
            ["name"] = "valid",
            ["type"] = "`$BOOLEAN`",
          },
        },
        ["name"] = "email_validate",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["example"] = "user@example.com",
                      ["kind"] = "query",
                      ["name"] = "email",
                      ["orig"] = "email",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/email-validate",
                ["parts"] = {
                  "email-validate",
                },
                ["select"] = {
                  ["exist"] = {
                    "email",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["generate"] = {
        ["fields"] = {},
        ["name"] = "generate",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["example"] = "#ffffff",
                      ["kind"] = "query",
                      ["name"] = "bg",
                      ["orig"] = "bg",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "M",
                      ["kind"] = "query",
                      ["name"] = "ec_level",
                      ["orig"] = "ec_level",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "#000000",
                      ["kind"] = "query",
                      ["name"] = "fg",
                      ["orig"] = "fg",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "png",
                      ["kind"] = "query",
                      ["name"] = "format",
                      ["orig"] = "format",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = 512,
                      ["kind"] = "query",
                      ["name"] = "size",
                      ["orig"] = "size",
                      ["type"] = "`$INTEGER`",
                    },
                    {
                      ["example"] = "https://example.com",
                      ["kind"] = "query",
                      ["name"] = "url",
                      ["orig"] = "url",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/qr",
                ["parts"] = {
                  "qr",
                },
                ["select"] = {
                  ["exist"] = {
                    "bg",
                    "ec_level",
                    "fg",
                    "format",
                    "size",
                    "url",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["example"] = "HELLO123",
                      ["kind"] = "query",
                      ["name"] = "data",
                      ["orig"] = "data",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "code128",
                      ["kind"] = "query",
                      ["name"] = "format",
                      ["orig"] = "format",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = 120,
                      ["kind"] = "query",
                      ["name"] = "height",
                      ["orig"] = "height",
                      ["type"] = "`$INTEGER`",
                    },
                    {
                      ["example"] = "svg",
                      ["kind"] = "query",
                      ["name"] = "output",
                      ["orig"] = "output",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = 400,
                      ["kind"] = "query",
                      ["name"] = "width",
                      ["orig"] = "width",
                      ["type"] = "`$INTEGER`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/barcode",
                ["parts"] = {
                  "barcode",
                },
                ["select"] = {
                  ["exist"] = {
                    "data",
                    "format",
                    "height",
                    "output",
                    "width",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["example"] = true,
                      ["kind"] = "query",
                      ["name"] = "full_page",
                      ["orig"] = "full_page",
                      ["type"] = "`$BOOLEAN`",
                    },
                    {
                      ["example"] = "https://example.com",
                      ["kind"] = "query",
                      ["name"] = "url",
                      ["orig"] = "url",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = 1280,
                      ["kind"] = "query",
                      ["name"] = "width",
                      ["orig"] = "width",
                      ["type"] = "`$INTEGER`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/screenshot",
                ["parts"] = {
                  "screenshot",
                },
                ["select"] = {
                  ["exist"] = {
                    "full_page",
                    "url",
                    "width",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["grammar"] = {
        ["fields"] = {
          {
            ["name"] = "correction_count",
            ["type"] = "`$INTEGER`",
          },
          {
            ["name"] = "corrections",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "language",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "text",
            ["op"] = {
              ["create"] = {
                ["req"] = true,
                ["type"] = "`$STRING`",
              },
            },
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "grammar",
        ["op"] = {
          ["create"] = {
            ["input"] = "data",
            ["name"] = "create",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "POST",
                ["orig"] = "/grammar",
                ["parts"] = {
                  "grammar",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["ipn"] = {
        ["fields"] = {
          {
            ["name"] = "asn",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "city",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "country",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "country_code",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "ip",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "latitude",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "longitude",
            ["type"] = "`$NUMBER`",
          },
          {
            ["name"] = "org",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "timezone",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "ipn",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["example"] = "8.8.8.8",
                      ["kind"] = "query",
                      ["name"] = "ip",
                      ["orig"] = "ip",
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/ip",
                ["parts"] = {
                  "ip",
                },
                ["select"] = {
                  ["exist"] = {
                    "ip",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["redact"] = {
        ["fields"] = {
          {
            ["name"] = "counts",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "entities",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "original_length",
            ["type"] = "`$INTEGER`",
          },
          {
            ["name"] = "redact",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "redacted",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "text",
            ["req"] = true,
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "redact",
        ["op"] = {
          ["create"] = {
            ["input"] = "data",
            ["name"] = "create",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "POST",
                ["orig"] = "/redact",
                ["parts"] = {
                  "redact",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = {
                    ["redact"] = "`reqdata`",
                  },
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["ssl"] = {
        ["fields"] = {
          {
            ["name"] = "cipher",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "days_remaining",
            ["type"] = "`$INTEGER`",
          },
          {
            ["name"] = "domain",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "expires_at",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "grade",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "issuer",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "protocol",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "sans",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "subject",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "valid",
            ["type"] = "`$BOOLEAN`",
          },
        },
        ["name"] = "ssl",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["example"] = "example.com",
                      ["kind"] = "query",
                      ["name"] = "domain",
                      ["orig"] = "domain",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = 443,
                      ["kind"] = "query",
                      ["name"] = "port",
                      ["orig"] = "port",
                      ["type"] = "`$INTEGER`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/ssl",
                ["parts"] = {
                  "ssl",
                },
                ["select"] = {
                  ["exist"] = {
                    "domain",
                    "port",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.sans`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["utility"] = {
        ["fields"] = {
          {
            ["name"] = "algo",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "hash",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "input",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "length",
            ["type"] = "`$INTEGER`",
          },
        },
        ["name"] = "utility",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["example"] = "sha256",
                      ["kind"] = "query",
                      ["name"] = "algo",
                      ["orig"] = "algo",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "hello world",
                      ["kind"] = "query",
                      ["name"] = "input",
                      ["orig"] = "input",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/hash",
                ["parts"] = {
                  "hash",
                },
                ["select"] = {
                  ["exist"] = {
                    "algo",
                    "input",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["whoi"] = {
        ["fields"] = {
          {
            ["name"] = "created",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "domain",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "expires",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "nameservers",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "registered",
            ["type"] = "`$BOOLEAN`",
          },
          {
            ["name"] = "registrar",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "status",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "updated",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "whoi",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["example"] = "example.com",
                      ["kind"] = "query",
                      ["name"] = "domain",
                      ["orig"] = "domain",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/whois",
                ["parts"] = {
                  "whois",
                },
                ["select"] = {
                  ["exist"] = {
                    "domain",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
