# frozen_string_literal: true

require_relative 'utils/mmr_v1'
require_relative 'utils/mmr_history'
require_relative 'utils/utilities'

module Valorant
  # This class is used to fetch data from the Valorant API -> ENDPOINTS: /mmr, /by-puuid/mmr/,
  # v1/mmr-history/, v1/by-puuid/mmr-history/
  class MMRStats
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
  end
end
