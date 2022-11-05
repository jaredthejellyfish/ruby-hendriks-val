# frozen_string_literal: false

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--require helpers/bonus_formatter.rb --format BonusFormatter'
end

desc 'Look for style guide offenses in your code'
task :rubocop do
  sh 'rubocop lib/ --format simple || true'
end

desc 'Run rspec on match.rb'
RSpec::Core::RakeTask.new(:match) do |t|
  t.rspec_opts = ' --require helpers/bonus_formatter.rb --format BonusFormatter'
  t.pattern = 'spec/match_spec.rb'
end

desc 'Run rspec on player.rb'
RSpec::Core::RakeTask.new(:player) do |t|
  t.rspec_opts = ' --require helpers/bonus_formatter.rb --format BonusFormatter'
  t.pattern = 'spec/player_spec.rb'
end

desc 'Run rspec on user.rb'
RSpec::Core::RakeTask.new(:user) do |t|
  t.rspec_opts = ' --require helpers/bonus_formatter.rb --format BonusFormatter'
  t.pattern = 'spec/user_spec.rb'
end

desc 'Run rspec on matches_history.rb'
RSpec::Core::RakeTask.new(:history) do |t|
  t.rspec_opts = '--require helpers/bonus_formatter.rb --format BonusFormatter'
  t.pattern = 'spec/matches_history_spec.rb'
end

desc 'Generate file loading for single file tests'
task :loader, [:type] do |_, args|
  puts
  puts "require 'json'"
  puts
  puts "file = File.read('/Users/gerardhernandez/code/ruby-hendriks-val/spec/helpers/#{args[:type]}.json')"
  puts 'data_hash = JSON.parse(file)'
  puts
end

task default: %i[rubocop spec]
