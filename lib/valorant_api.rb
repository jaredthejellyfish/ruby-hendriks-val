# frozen_string_literal: true

require 'rest-client'
require 'json'

require_relative 'match'
require_relative 'user'
require_relative 'matches_history'
require_relative 'mmr_v1'
require_relative 'mmr_history'
require_relative 'leader_board'

# This class is the main class of the gem. It is used to get the data from the Valorant API
class ValorantAPI
  def initialize
    @base_url = 'https://api.henrikdev.xyz/valorant/'
  end

  def account_data(name, tag)
    User.new(fetch_resposne("v1/account/#{name}/#{tag}"))
  end

  def match_data(match_id)
    Match.new(fetch_resposne("v2/match/#{match_id}"))
  end

  def matches_history(name, tag, region = 'eu', filter: '')
    MatcheshHistory.new(fetch_resposne("v3/matches/#{region}/#{name}/#{tag}?filter=#{validate_filter(filter)}"))
  end

  def matches_history_by_puuid(puuid, region = 'eu', filter: '')
    MatcheshHistory.new(fetch_resposne("v3/by-puuid/matches/#{region}/#{puuid}?filter=#{validate_filter(filter)}"))
  end

  def mmr_data(name, tag, region = 'eu', version: 'v1')
    MMRV1.new(fetch_resposne("#{version}/mmr/#{region}/#{name}/#{tag}"))
  end

  def mmr_data_by_puuid(puuid, region = 'eu', version: 'v1')
    MMRV1.new(fetch_resposne("#{version}/by-puuid/mmr/#{region}/#{puuid}"))
  end

  def mmr_history(name, tag, region = 'eu')
    MMRHistory.new(fetch_resposne("v1/mmr-history/#{region}/#{name}/#{tag}"))
  end

  def mmr_history_by_puuid(puuid, region = 'eu')
    MMRHistory.new(fetch_resposne("v1/by-puuid/mmr-history/#{region}/#{puuid}"))
  end

  def articles(filter = '', locale = 'en-us')
    Articles.new(fetch_resposne("v1/website/#{validate_locale(locale)}?filter=#{validate_filter(filter)}"))
  end

  def leader_board(region = 'eu', name = '', tag = '')
    LeaderBoard.new(fetch_resposne("v1/leaderboard/#{region}?name=#{name}&tag=#{tag}", validate: false))
  end

  def content
    fetch_resposne('v1/content')
  end

  def server_status(region)
    fetch_resposne("v1/status/#{region}")['data'].transform_keys(&:to_sym)
  end

  private

  def fetch_resposne(endpoint, validate: true)
    response = RestClient.get(@base_url + endpoint)
    return JSON.parse(validate_response(response)) unless validate == false

    JSON.parse(response)
  end

  def validate_response(response)
    return response if response.code == 200

    raise "Error: #{response['status']} - #{response['message']}"
  end

  def validate_filter(filter)
    return if filter.empty?

    filters = %w[escalation spikerush deathmatch competitive unrated replication game_updates dev esports announcments]
    raise "Error: Invalid filter. Valid filters are: #{filters.join(', ')}" unless filters.include?(filter)

    filter
  end

  def validate_locale(locale)
    return if locale.empty?

    locales = %w[en-us en-gb de-de es-es fr-fr it-it ru-ru tr-tr es-mx ja-jp ko-kr pt-br]
    raise "Error: Invalid locale. Valid locales are: #{locales.join(', ')}" unless locales.include?(locale)

    locale
  end
end
