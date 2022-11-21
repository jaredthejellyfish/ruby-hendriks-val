# frozen_string_literal: true

require_relative '../lib/valorant'

# Require all utils
Dir["#{File.dirname(__FILE__)}../lib/api/utils"].each do |file|
  require File.basename(file, File.extname(file))
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
