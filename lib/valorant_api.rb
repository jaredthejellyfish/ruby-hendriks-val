# frozen_string_literal: false

require 'rest-client'
require 'json'
require_relative 'player'
require_relative 'match'
require_relative 'user'

# This class is the main class of the gem. It is used to get the data from the Valorant API
class ValorantAPI
  def initialize
    @base_url = 'https://api.henrikdev.xyz/valorant/'
  end

  def match_from_id(match_id)
    Match.new(fetch_resposne("v2/match/#{match_id}"))
  end

  def match_data(match_id)
    Match.new(fetch_resposne("v2/match/#{match_id}"))
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

api = ValorantAPI.new
p api.match_from_id('a8237ec4-1013-4398-b3af-5d245e9d75e1')
