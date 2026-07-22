package = "voxgig-sdk-kiprio-api-suite"
version = "0.0.1-1"
source = {
  -- git+https (GitHub dropped git:// in 2022); pin the install to the release
  -- tag pushed by `make publish`, and point at the lua/ subdir of the monorepo.
  url = "git+https://github.com/voxgig-sdk/kiprio-api-suite-sdk.git",
  tag = "lua/v0.0.1",
  dir = "kiprio-api-suite-sdk/lua"
}
description = {
  summary = "Unofficial generated Lua SDK for the Kiprio public API. Not affiliated with or endorsed by the upstream API provider.",
  homepage = "https://github.com/voxgig-sdk/kiprio-api-suite-sdk",
  issues_url = "https://github.com/voxgig-sdk/kiprio-api-suite-sdk/issues",
  license = "MIT",
  labels = { "voxgig", "sdk", "generated-sdk", "openapi", "api-client", "kiprio-api-suite" }
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["kiprio-api-suite_sdk"] = "kiprio-api-suite_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
