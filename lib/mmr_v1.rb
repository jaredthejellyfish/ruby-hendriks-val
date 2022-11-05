# frozen_string_literal: false

require 'Date'

# This class is used to get the @data from MMR
class MMRV1
  attr_reader :currenttier, :currenttierpatched, :images, :ranking_in_tier, :mmr_change_to_last_game, :elo, :name,
              :tag, :old, :date

  def initialize(hash)
    @data = hash['data']
    @currenttier = @data['currenttier']
    @currenttierpatched = @data['currenttierpatched']
    @images = @data['images']
    @ranking_in_tier = @data['ranking_in_tier']
    @mmr_change_to_last_game = @data['mmr_change_to_last_game']
    @elo = @data['elo']
    @old = @data['old']
    fetch_date
    fetch_nametag
  end

  private

  def fetch_date
    @date = if @data['date'].nil?
              Time.now
            else
              Date.parse(@data['date'])
            end
  end

  def fetch_nametag
    @name = @data['name']
    @tag = @data['tag']
  end
end