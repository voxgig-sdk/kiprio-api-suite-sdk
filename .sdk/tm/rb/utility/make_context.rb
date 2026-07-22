# KiprioApiSuite SDK utility: make_context
require_relative '../core/context'
module KiprioApiSuiteUtilities
  MakeContext = ->(ctxmap, basectx) {
    KiprioApiSuiteContext.new(ctxmap, basectx)
  }
end
