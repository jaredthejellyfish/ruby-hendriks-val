# frozen_string_literal: true

require_relative 'utils/user'
require_relative 'utils/utilities'

module Valorant
  # This class is used to fetch data from the Valorant API -> ENDPOINT: /account
  class AccountStats
    def self.account_data(name, tag)
      User.new(fetch_resposne("v1/account/#{name}/#{tag}"))
    end
  end
end
