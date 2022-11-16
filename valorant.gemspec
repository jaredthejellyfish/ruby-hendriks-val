# frozen_string_literal: true

require_relative "lib/api/version"

Gem::Specification.new do |spec|
  spec.name = "valorant"
  spec.version = Valorant::Api::VERSION
  spec.authors = ["Gerard Hernandez"]
  spec.email = ["ger.almenara@gmail.com"]

  spec.summary = "An API wrapper for the Hendriks Valorant API 🍬"
  spec.homepage = "https://github.com/jaredthejellyfish/ruby-hendriks-val"
  spec.required_ruby_version = ">= 3.1.2"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jaredthejellyfish/ruby-hendriks-val"
  spec.metadata["changelog_uri"] = "https://github.com/jaredthejellyfish/ruby-hendriks-val"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  require 'rake'
  spec.files = FileList['lib/**/*.rb',
                        'bin/*',
                        '[A-Z]*'].to_a
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
