require_relative '../library'
require_relative '../book'

require 'yaml'
require 'rspec/collection_matchers'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    # Disable the `expect` sytax...
    c.syntax = :should
  end
end