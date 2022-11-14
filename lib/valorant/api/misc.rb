# frozen_string_literal: true

require_relative 'utils/articles'
require_relative 'utils/leader_board'
require_relative 'utils/utilities'

module Valorant
  # This class is used to fetch data from the Valorant API -> ENDPOINTS: /v1/website/, /v1/leaderboard/,
  # v1/content/, v1/status/
  class Misc
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
  end
end