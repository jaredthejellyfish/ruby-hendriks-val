# frozen_string_literal: false

# This class is used to get the data from the User
class User
  attr_reader :puuid, :region, :name, :tag, :account_level, :card, :last_update, :last_update_raw

  def initialize(hash)
    data = hash['data']
    @puuid = data['puuid']
    @region = data['region']
    @name = data['name']
    @tag = data['tag']
    @account_level = data['account_level']
    @card = data['card']
    @last_update = data['last_update']
    @last_update_raw = data['last_update_raw']
  end
end
