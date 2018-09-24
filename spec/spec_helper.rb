# frozen_string_literal: true
require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.formatter = :documentation
end

at_exit {ChefSpec::Coverage.report!}
# report of all the test
# touch is the report of how many test has been ran
