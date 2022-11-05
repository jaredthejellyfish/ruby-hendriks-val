require 'rest-client'
require 'json'

begin
  require 'valorant_api'
rescue LoadError
end

describe ValorantAPI do
  let(:api) { ValorantAPI.new }

  describe '#account_data' do
    it 'is a User object' do
      expect(api.account_data('jaredthejelly', 'yours')).to be_a(User)
    end

    it 'has a matching name, tag & region' do
      data = api.account_data('jaredthejelly', 'yours')

      expect(data.name).to eq('jaredthejelly')
      expect(data.tag).to eq('yours')
      expect(data.region).to eq('eu')
    end
  end

  describe '#match_data' do
    it 'is a Match object' do
      expect(api.match_data('97d9ee21-71c4-4b27-805a-57cf614b89f5')).to be_a(Match)
    end

    it 'has a matching id' do
      data = api.match_data('97d9ee21-71c4-4b27-805a-57cf614b89f5')

      expect(data.matchid).to eq('97d9ee21-71c4-4b27-805a-57cf614b89f5')
    end
  end

  describe '#match_history' do
    it 'is a MatcheshHistory object' do
      history = api.match_history('jaredthejelly', 'yours')
      expect(history).to be_a(MatcheshHistory)
      expect(history.matches[0]).to be_a(Match)
      expect(history.matches[0].all_players[0]).to be_a(Player)
    end

    it 'contains matches' do
      history = api.match_history('jaredthejelly', 'yours')
      expect(history.matches.length).to be > 0
    end

    it 'matches contain players' do
      history = api.match_history('jaredthejelly', 'yours')
      expect(history.matches[0].all_players.length).to be > 0
    end
  end

  describe '#match_history_by_puuid' do
    it 'is a MatcheshHistory object' do
      history = api.match_history_by_puuid('140479d6-a2e5-5ca2-99d5-635b4d34b66c')
      expect(history).to be_a(MatcheshHistory)
      expect(history.matches[0]).to be_a(Match)
      expect(history.matches[0].all_players[0]).to be_a(Player)
    end

    it 'contains matches' do
      history = api.match_history_by_puuid('140479d6-a2e5-5ca2-99d5-635b4d34b66c')
      expect(history.matches.length).to be > 0
    end

    it 'matches contain players' do
      history = api.match_history_by_puuid('140479d6-a2e5-5ca2-99d5-635b4d34b66c')
      expect(history.matches[0].all_players.length).to be > 0
    end
  end

  describe '#server_status' do
    it 'returns a hash' do
      expect(api.server_status).to be_a(Hash)
    end

    it 'has a matching region' do
      expect(api.server_status.keys).to eq(%i[maintenances incidents])
    end
  end

  describe '#fetch_resposne' do
    it 'returns a hash' do
      expect(api.send(:fetch_resposne, 'v1/account/jaredthejelly/yours')).to be_a(Hash)
    end
  end

  describe '#validate_response' do
    it 'raises an error if the response is not 200' do
      expect { api.send(:validate_response, { 'status' => 400, 'message' => 'Error' }) }.to raise_error(RuntimeError)
    end
  end
end
