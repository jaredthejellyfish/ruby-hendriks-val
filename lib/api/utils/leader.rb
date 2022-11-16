# frozen_string_literal: true

# Leader class
class Leader
  attr_accessor :leader_board_rank, :ranked_rating, :number_of_wins, :comptetitive_tier, :puuid, :game_name,
                :tag_line, :player_card_id, :title_id, :is_banned, :is_anonymized

  def initialize(data)
    @leader_board_rank = data['leaderboardRank']
    @ranked_rating = data['rankedRating']
    @number_of_wins = data['numberOfWins']
    @comptetitive_tier = data['competitiveTier']
    fetch_player_data(data)
  end

  def fetch_player_data(data)
    @puuid = data['puuid']
    @game_name = data['gameName']
    @tag_line = data['tagLine']
    @player_card_id = data['PlayerCardID']
    @title_id = data['TitleID']
    @is_banned = data['IsBanned']
    @is_anonymized = data['IsAnonymized']
  end
end

# DOCUMENTATION

# @PlayerCardID
# @TitleID
# @IsBanned
# @IsAnonymized
# @puuid
# @gameName
# @tagLine
# @leaderboardRank
# @rankedRating
# @numberOfWins
# @competitiveTier
