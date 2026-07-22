# KiprioApiSuite SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module KiprioApiSuiteFeatures
  def self.make_feature(name)
    case name
    when "base"
      KiprioApiSuiteBaseFeature.new
    when "test"
      KiprioApiSuiteTestFeature.new
    else
      KiprioApiSuiteBaseFeature.new
    end
  end
end
