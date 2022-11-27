# frozen_string_literal: true

require_relative 'player'

# This class is used to get the data from a match
class Match
  attr_reader :game_version, :game_start_patched, :season_id, :platform, :region,
              :cluster, :map, :mode, :queue, :rounds_played, :matchid, :game_length,
              :game_start, :winning_team, :red_rounds_won, :red_rounds_lost,
              :blue_rounds_won, :blue_rounds_lost, :red_team, :blue_team, :all_players

  def initialize(data)
    @meta_data = data['data']['metadata']
    @player_data = data['data']['players']
    @team_data = data['data']['teams']

    fetch_game_info
    fetch_game_type
    fetch_game_statistics

    fetch_players
  end

  def mvp
    @all_players.max_by(&:score)
  end

  def mvp_red
    @red_team.max_by(&:score)
  end

  def mvp_blue
    @blue_team.max_by(&:score)
  end

  def accuracy(name, tag)
    player = @all_players.select { |player| player.name.gsub(' ', '') == name.gsub(' ', '') && player.tag == tag }
    [player[0].headshots, player[0].bodyshots, player[0].legshots]
  end

  def fetch_game_info
    @game_version = @meta_data['game_version']
    @game_start_patched = @meta_data['game_start_patched']
    @season_id = @meta_data['season_id']
    @platform = @meta_data['platform']
    @region = @meta_data['region']
    @cluster = @meta_data['cluster']
  end

  def fetch_game_type
    @map = @meta_data['map']
    @mode = @meta_data['mode']
    @queue = @meta_data['queue']
  end

  def fetch_game_statistics
    @rounds_played = @meta_data['rounds_played']
    @matchid = @meta_data['matchid']
    @game_length = @meta_data['game_length']
    @game_start = @meta_data['game_start']
  end

  def fetch_players
    fetch_all_players

    return if @queue == 'Deathmatch'

    fetch_red_team
    fetch_blue_team
    fetch_team_stats
  end

  def fetch_team_stats
    @winning_team = @team_data['red']['has_won'] ? 'red' : 'blue'
    @red_rounds_won = @team_data['red']['rounds_won']
    @red_rounds_lost = @team_data['red']['rounds_lost']
    @blue_rounds_won = @team_data['blue']['rounds_won']
    @blue_rounds_lost = @team_data['blue']['rounds_lost']
  end

  def fetch_red_team
    red_team = @player_data['red']
    @red_team = []
    red_team.each do |player|
      @red_team << Player.new(player)
    end
  end

  def fetch_blue_team
    blue_team = @player_data['blue']
    @blue_team = []
    blue_team.each do |player|
      @blue_team << Player.new(player)
    end
  end

  def fetch_all_players
    @all_players = @player_data['all_players'].each_with_object([]) do |player, array|
      array << Player.new(player)
    end
  end
end
