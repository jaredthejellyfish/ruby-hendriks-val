# frozen_string_literal: true

require_relative 'leader'
# Leaderboard class
class LeaderBoard
  def initialize(data)
    @board = data
    leaders
  end

  def leaders
    @board.map { |leader| Leader.new(leader) }
  end
end
