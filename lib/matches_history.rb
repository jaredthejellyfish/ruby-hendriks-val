# frozen_string_literal: false

require_relative 'match'
require 'json'

# This class is used to get the data from the match history
class MatcheshHistory
  attr_reader :matches

  def initialize(hash)
    @matches = fetch_matches(hash['data'])
  end

  private

  def fetch_matches(matches_json)
    matches_json.each_with_object([]) do |match, arr|
      reformated_data = { 'data' => match }
      arr << Match.new(reformated_data)
    end
  end
end
