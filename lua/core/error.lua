-- KiprioApiSuite SDK error

local KiprioApiSuiteError = {}
KiprioApiSuiteError.__index = KiprioApiSuiteError


function KiprioApiSuiteError.new(code, msg, ctx)
  local self = setmetatable({}, KiprioApiSuiteError)
  self.is_sdk_error = true
  self.sdk = "KiprioApiSuite"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function KiprioApiSuiteError:error()
  return self.msg
end


function KiprioApiSuiteError:__tostring()
  return self.msg
end


return KiprioApiSuiteError
