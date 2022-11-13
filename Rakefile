# frozen_string_literal: true

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--require helpers/bonus_formatter.rb --format BonusFormatter'
end

desc 'Look for style guide offenses in your code'
task :rubocop do
  sh 'rubocop lib/ --format simple || true'
end

desc 'Open an irb session preloaded with the environment'
task :console do
  require 'rubygems'
  require 'pry'

  Pry.start
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
RSpec::Core::RakeTask.new(:matches_history) do |t|
  t.rspec_opts = '--require helpers/bonus_formatter.rb --format BonusFormatter'
  t.pattern = 'spec/matches_history_spec.rb'
end

desc 'Run rspec on mmr_v1_spec.rb'
RSpec::Core::RakeTask.new(:mmrv1) do |t|
  t.rspec_opts = '--require helpers/bonus_formatter.rb --format BonusFormatter'
  t.pattern = 'spec/mmr_v1_spec.rb'
end

desc 'Run rspec on mmr_history_spec.rb'
RSpec::Core::RakeTask.new(:mmr_history) do |t|
  t.rspec_opts = '--require helpers/bonus_formatter.rb --format BonusFormatter'
  t.pattern = 'spec/mmr_history_spec.rb'
end

desc 'Run rspec on article.rb'
RSpec::Core::RakeTask.new(:article) do |t|
  t.rspec_opts = '--require helpers/bonus_formatter.rb --format BonusFormatter'
  t.pattern = 'spec/article_spec.rb'
end

desc 'Run rspec on article.rb'
RSpec::Core::RakeTask.new(:articles) do |t|
  t.rspec_opts = '--require helpers/bonus_formatter.rb --format BonusFormatter'
  t.pattern = 'spec/article_spec.rb'
end

desc 'Run rspec on leader.rb'
RSpec::Core::RakeTask.new(:leader) do |t|
  t.rspec_opts = '--require helpers/bonus_formatter.rb --format BonusFormatter'
  t.pattern = 'spec/leader_spec.rb'
end

desc 'Run rspec on leader_board.rb'
RSpec::Core::RakeTask.new(:leader_board) do |t|
  t.rspec_opts = '--require helpers/bonus_formatter.rb --format BonusFormatter'
  t.pattern = 'spec/leader_board_spec.rb'
end

desc 'Run rspec on valorant_api.rb'
RSpec::Core::RakeTask.new(:api) do |t|
  t.rspec_opts = '--require helpers/bonus_formatter.rb --format BonusFormatter'
  t.pattern = 'spec/valorant_api_spec.rb'
end

desc 'Run rspec on :focus tagged tests'
RSpec::Core::RakeTask.new(:focus) do |t|
  t.rspec_opts = '--tag focus --require helpers/bonus_formatter.rb --format BonusFormatter'
end

namespace :api do
  desc 'Run rspec on account_data()'
  RSpec::Core::RakeTask.new(:account_data) do |t|
    t.rspec_opts = '--tag account_data --require helpers/bonus_formatter.rb --format BonusFormatter'
  end

  desc 'Run rspec on match_data()'
  RSpec::Core::RakeTask.new(:match_data) do |t|
    t.rspec_opts = '--tag match_data --require helpers/bonus_formatter.rb --format BonusFormatter'
  end

  desc 'Run rspec on matches_history()'
  RSpec::Core::RakeTask.new(:matches_history) do |t|
    t.rspec_opts = '--tag matches_history --require helpers/bonus_formatter.rb --format BonusFormatter'
  end

  desc 'Run rspec on matches_history_by_puuid()'
  RSpec::Core::RakeTask.new(:matches_history_by_puuid) do |t|
    t.rspec_opts = '--tag matches_history_by_puuid --require helpers/bonus_formatter.rb --format BonusFormatter'
  end

  desc 'Run rspec on mmr_data()'
  RSpec::Core::RakeTask.new(:mmr_data) do |t|
    t.rspec_opts = '--tag mmr_data --require helpers/bonus_formatter.rb --format BonusFormatter'
  end

  desc 'Run rspec on mmr_data_by_puuid()'
  RSpec::Core::RakeTask.new(:mmr_data_by_puuid) do |t|
    t.rspec_opts = '--tag mmr_data_by_puuid --require helpers/bonus_formatter.rb --format BonusFormatter'
  end

  desc 'Run rspec on mmr_history()'
  RSpec::Core::RakeTask.new(:mmr_history) do |t|
    t.rspec_opts = '--tag mmr_history --require helpers/bonus_formatter.rb --format BonusFormatter'
  end

  desc 'Run rspec on mmr_history_by_puuid()'
  RSpec::Core::RakeTask.new(:mmr_history_by_puuid) do |t|
    t.rspec_opts = '--tag mmr_history_by_puuid --require helpers/bonus_formatter.rb --format BonusFormatter'
  end

  desc 'Run rspec on server_status()'
  RSpec::Core::RakeTask.new(:server_status) do |t|
    t.rspec_opts = '--tag server_status --require helpers/bonus_formatter.rb --format BonusFormatter'
  end

  desc 'Run rspec on fetch_resposne()'
  RSpec::Core::RakeTask.new(:fetch_resposne) do |t|
    t.rspec_opts = '--tag fetch_resposne --require helpers/bonus_formatter.rb --format BonusFormatter'
  end

  desc 'Run rspec on validate_response()'
  RSpec::Core::RakeTask.new(:validate_response) do |t|
    t.rspec_opts = '--tag validate_response --require helpers/bonus_formatter.rb --format BonusFormatter'
  end

  desc 'Run rspec on validate_filter()'
  RSpec::Core::RakeTask.new(:validate_filter) do |t|
    t.rspec_opts = '--tag validate_filter --require helpers/bonus_formatter.rb --format BonusFormatter'
  end

  desc 'Run rspec on validate_filter()'
  RSpec::Core::RakeTask.new(:validate_locale) do |t|
    t.rspec_opts = '--tag validate_locale --require helpers/bonus_formatter.rb --format BonusFormatter'
  end

  desc 'Run rspec on articles()'
  RSpec::Core::RakeTask.new(:articles) do |t|
    t.rspec_opts = '--tag articles --require helpers/bonus_formatter.rb --format BonusFormatter'
  end

  desc 'Run rspec on leader_board()'
  RSpec::Core::RakeTask.new(:leader_board) do |t|
    t.rspec_opts = '--tag leader_board --require helpers/bonus_formatter.rb --format BonusFormatter'
  end
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
