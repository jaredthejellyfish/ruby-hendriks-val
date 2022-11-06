# frozen_string_literal: false

require 'rest-client'
require 'json'

require_relative 'match'
require_relative 'user'
require_relative 'matches_history'
require_relative 'mmr_v1'
require_relative 'mmr_history'

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
    MatcheshHistory.new(fetch_resposne("v3/matches/#{region}/#{name}/#{tag}?filter=#{filter}"))
  end

  def matches_history_by_puuid(puuid, region = 'eu', filter: '')
    MatcheshHistory.new(fetch_resposne("v3/by-puuid/matches/#{region}/#{puuid}?filter=#{filter}"))
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

  def server_status(region)
    fetch_resposne("v1/status/#{region}")['data'].transform_keys(&:to_sym)
  end

  private

  def fetch_resposne(endpoint)
    response = RestClient.get(@base_url + endpoint)
    validate_response(JSON.parse(response))
  end

  def validate_response(response)
    return response if response['status'] == 200

    raise "Error: #{response['status']} - #{response['message']}"
  end
end
