# frozen_string_literal: true

require_relative 'match'

# This class is used to get the data from the match history
class MatcheshHistory
  attr_reader :matches

  def initialize(hash)
    @matches = fetch_matches(hash['data'])
  end

  def accuracy(name, tag)
    body_shots = 0
    head_shots = 0
    leg_shots = 0

    @matches.each do |match|
      headshots, bodyshots, legshots = match.accuracy(name, tag)

      head_shots += headshots
      body_shots += bodyshots
      leg_shots += legshots
    end

    [head_shots, body_shots, leg_shots]
  end

  def most_played(name, tag)
    most_played = []
    @matches.each do |match|
      match.all_players.each do |player|
        next unless player.name.gsub(' ', '') == name.gsub(' ', '') && player.tag == tag

        most_played << player.character
      end
    end
    most_played.max_by { |i| most_played.count(i) }
  end

  private

  def fetch_matches(matches_json)
    matches_json.each_with_object([]) do |match, arr|
      reformated_data = { 'data' => match }
      arr << Match.new(reformated_data)
    end
  end
end
