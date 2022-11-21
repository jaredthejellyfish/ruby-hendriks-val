# frozen_string_literal: true

RSpec.describe Valorant::MatchStats, match: true do
  let(:client) { Valorant::MatchStats }
  let(:match_data) { client.match_data('97d9ee21-71c4-4b27-805a-57cf614b89f5') }
  let(:matches_history) { client.matches_history('jaredthejelly', 'yours') }
  let(:match_history_puuid) { client.matches_history_by_puuid('140479d6-a2e5-5ca2-99d5-635b4d34b66c') }

  describe '#match_data', match_data: true do
    it 'takes 1 parameter' do
      expect((Valorant::MatchStats.method(:match_data).parameters.flatten - [:req]).count).to eq(1)
    end

    it 'is a Match object' do
      expect(match_data).to be_a(Match)
    end

    it 'has a matching id' do
      expect(match_data.matchid).to eq('97d9ee21-71c4-4b27-805a-57cf614b89f5')
    end
  end

  describe '#matches_history', matches_history: true do
    it 'takes 4 parameters' do
      expect((Valorant::MatchStats.method(:matches_history).parameters.flatten - %i[req opt
                                                                                    key]).count).to eq(4)
    end

    it 'is a MatcheshHistory object' do
      expect(matches_history).to be_a(MatcheshHistory)
      expect(matches_history.matches[0]).to be_a(Match)
      expect(matches_history.matches[0].all_players[0]).to be_a(Player)
    end

    it 'contains matches' do
      expect(matches_history.matches.length).to be > 0
    end

    it 'matches contain players' do
      expect(matches_history.matches[0].all_players.length).to be > 0
    end
  end

  describe '#matches_history_by_puuid', matches_history_by_puuid: true do
    it 'takes 3 parameters' do
      expect((Valorant::MatchStats.method(:matches_history_by_puuid).parameters.flatten - %i[req opt
                                                                                             key]).count).to eq(3)
    end

    it 'is a MatcheshHistory object' do
      expect(match_history_puuid).to be_a(MatcheshHistory)
      expect(match_history_puuid.matches[0]).to be_a(Match)
      expect(match_history_puuid.matches[0].all_players[0]).to be_a(Player)
    end

    it 'contains matches' do
      expect(match_history_puuid.matches.length).to be > 0
    end

    it 'matches contain players' do
      expect(match_history_puuid.matches[0].all_players.length).to be > 0
    end
  end
end
