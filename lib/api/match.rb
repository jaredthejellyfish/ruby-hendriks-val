# frozen_string_literal: true

require_relative "utils/match"
require_relative "utils/matches_history"
require_relative "utils/utilities"

module Valorant
  # This class is used to fetch data from the Valorant API -> ENDPOINTS: /match, /matches
  class MatchStats
    def self.match_data(match_id)
      Match.new(fetch_resposne("v2/match/#{match_id}"))
    end

    def self.matches_history(name, tag, region = "eu", filter: "")
      MatcheshHistory.new(fetch_resposne("v3/matches/#{region}/#{name}/#{tag}?filter=#{validate_filter(filter)}"))
    end

    def self.matches_history_by_puuid(puuid, region = "eu", filter: "")
      MatcheshHistory.new(fetch_resposne("v3/by-puuid/matches/#{region}/#{puuid}?filter=#{validate_filter(filter)}"))
    end
  end
end
