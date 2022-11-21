# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'

desc 'Look for style guide offenses in your code'
task :rubocop do
  sh 'rubocop lib/ --format simple || true'
end

desc 'Look for style guide offenses in your code and fix them.'
task :rubofix do
  sh 'rubocop lib/ --fix --format simple || true'
end

desc 'Install required gems'
task :install do
  sh 'bundle install'
end

task :console do
  sh 'bin/console'
end

## Exposed API methods tests

namespace :api do
  desc 'Run rspec on api/match.rb'
  RSpec::Core::RakeTask.new(:match) do |t|
    t.rspec_opts = ' --require helpers/bonus_formatter.rb --format BonusFormatter'
    t.pattern = 'spec/valorant/api_match_spec.rb'
  end

  desc 'Run rspec on api/account.rb'
  RSpec::Core::RakeTask.new(:account) do |t|
    t.rspec_opts = ' --require helpers/bonus_formatter.rb --format BonusFormatter'
    t.pattern = 'spec/valorant/api_account_spec.rb'
  end

  desc 'Run rspec on api/misc.rb'
  RSpec::Core::RakeTask.new(:misc) do |t|
    t.rspec_opts = ' --require helpers/bonus_formatter.rb --format BonusFormatter'
    t.pattern = 'spec/valorant/api_misc_spec.rb'
  end

  desc 'Run rspec on api/mmr.rb'
  RSpec::Core::RakeTask.new(:mmr) do |t|
    t.rspec_opts = ' --require helpers/bonus_formatter.rb --format BonusFormatter'
    t.pattern = 'spec/valorant/api_mmr_spec.rb'
  end
end

task default: %i[spec rubocop]
