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

task :console do
  sh 'bin/console'
end

task default: %i[spec rubocop]
