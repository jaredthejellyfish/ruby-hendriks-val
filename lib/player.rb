# frozen_string_literal: false

# This class is used to get the data from the player
class Player
  attr_reader :puuid, :name, :tag, :team, :level, :character, :currenttier, :currenttier_patched, :party_id,
              :player_card, :player_title, :assets_card, :assets_agent, :session_playtime, :behavior, :ability_casts,
              :score, :kills, :deaths, :assists, :bodyshots, :headshots, :legshots, :spent_overall, :spent_average,
              :damage_made, :damage_received

  def initialize(data)
    @data = data

    fetch_general_data
    fetch_aesthetics_data
    fetch_session_data
    fetch_performance_data
    fetch_economy_data
    fetch_damage_data
  end

  def name_tag
    "#{@name} ##{@tag}"
  end

  def kd
    (@kills.to_f / @deaths).round(2)
  end

  private

  def fetch_general_data
    @puuid = @data['puuid']
    @name = @data['name']
    @tag = @data['tag']
    @team = @data['team']
    @level = @data['level']
    @character = @data['character']
    @currenttier = @data['currenttier']
    @currenttier_patched = @data['currenttier_patched']
    @party_id = @data['party_id']
  end

  def fetch_aesthetics_data
    @player_card = @data['player_card']
    @player_title = @data['player_title']
    @assets_card = keys_to_sim(@data['assets']['card']) # This is a hash
    @assets_agent = keys_to_sim(@data['assets']['agent']) # This is a hash
  end

  def fetch_session_data
    @session_playtime = @data['session_playtime']['seconds'].to_i
    @behavior = keys_to_sim(@data['behavior']) # This is a hash
    @ability_casts = keys_to_sim(@data['ability_casts']) # This is a hash
  end

  def fetch_performance_data
    @score = @data['stats']['score']
    @kills = @data['stats']['kills']
    @deaths = @data['stats']['deaths']
    @assists = @data['stats']['assists']
    @bodyshots = @data['stats']['bodyshots']
    @headshots = @data['stats']['headshots']
    @legshots = @data['stats']['legshots']
  end

  def fetch_economy_data
    @spent_overall = @data['economy']['spent']['overall'].to_i
    @spent_average = @data['economy']['spent']['average'].to_i
  end

  def fetch_damage_data
    @damage_made = @data['damage_made'].to_i
    @damage_received = @data['damage_received'].to_i
    return unless @damage_made.zero? || @damage_received.zero?

    @damage_made = nil
    @damage_received = nil
  end

  def session_platform_formatter(platform)
    "#{platform['tpye']} #{platform['os'].values.join(' ')}"
  end

  def keys_to_sim(hash)
    hash.transform_keys(&:to_sym)
  end
end
