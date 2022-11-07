require 'rest-client'
require 'json'

begin
  require 'valorant_api'
rescue LoadError
end

describe ValorantAPI do
  let(:api) { ValorantAPI.new }

  describe '#account_data', account_data: true do
    let(:account_data) { api.account_data('jaredthejelly', 'yours') }

    it 'takes 2 parameters' do
      expect((ValorantAPI.allocate.method(:account_data).parameters.flatten - [:req]).count).to eq(2)
    end

    it 'is a User object' do
      expect(account_data).to be_a(User)
    end

    it 'has a matching name, tag & region' do
      expect(account_data.name).to eq('jaredthejelly')
      expect(account_data.tag).to eq('yours')
      expect(account_data.region).to eq('eu')
    end
  end

  describe '#match_data', match_data: true do
    let(:match_data) { api.match_data('97d9ee21-71c4-4b27-805a-57cf614b89f5') }

    it 'takes 1 parameter' do
      expect((ValorantAPI.allocate.method(:match_data).parameters.flatten - [:req]).count).to eq(1)
    end

    it 'is a Match object' do
      expect(match_data).to be_a(Match)
    end

    it 'has a matching id' do
      expect(match_data.matchid).to eq('97d9ee21-71c4-4b27-805a-57cf614b89f5')
    end
  end

  describe '#matches_history', matches_history: true do
    let(:matches_history) { api.matches_history('jaredthejelly', 'yours') }

    it 'takes 4 parameters' do
      expect((ValorantAPI.allocate.method(:matches_history).parameters.flatten - %i[req opt key]).count).to eq(4)
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
    let(:match_histor_puuid) { api.matches_history_by_puuid('140479d6-a2e5-5ca2-99d5-635b4d34b66c') }

    it 'takes 3 parameters' do
      expect((ValorantAPI.allocate.method(:matches_history_by_puuid).parameters.flatten - %i[req opt key]).count).to eq(3)
    end

    it 'is a MatcheshHistory object' do
      expect(match_histor_puuid).to be_a(MatcheshHistory)
      expect(match_histor_puuid.matches[0]).to be_a(Match)
      expect(match_histor_puuid.matches[0].all_players[0]).to be_a(Player)
    end

    it 'contains matches' do
      expect(match_histor_puuid.matches.length).to be > 0
    end

    it 'matches contain players' do
      expect(match_histor_puuid.matches[0].all_players.length).to be > 0
    end
  end

  describe '#mmr_data', mmr_data: true do
    let(:mmr_data) { api.mmr_data('jaredthejelly', 'yours') }

    it 'takes 4 parameters' do
      expect((ValorantAPI.allocate.method(:mmr_data).parameters.flatten - %i[req opt key]).count).to eq(4)
    end

    it 'is a MMRV1 object' do
      expect(mmr_data).to be_a(MMRV1)
    end

    it 'has a matching name, tag & region' do
      expect(mmr_data.name).to eq('jaredthejelly')
      expect(mmr_data.tag).to eq('yours')
    end
  end

  describe '#mmr_data_by_puuid', mmr_data_by_puuid: true do
    let(:mmr_data_puuid) { api.mmr_data_by_puuid('140479d6-a2e5-5ca2-99d5-635b4d34b66c') }

    it 'takes 3 parameters' do
      expect((ValorantAPI.allocate.method(:mmr_data_by_puuid).parameters.flatten - %i[req opt key]).count).to eq(3)
    end

    it 'is a MMRV1 object' do
      expect(mmr_data_puuid).to be_a(MMRV1)
    end
  end

  describe '#mmr_history', mmr_history: true do
    let(:mmr_history) { api.mmr_history('jaredthejelly', 'yours') }

    it 'takes 3 parameters' do
      expect((ValorantAPI.allocate.method(:mmr_history).parameters.flatten - %i[req opt key]).count).to eq(3)
    end

    it 'is a MMRHistory object' do
      expect(mmr_history).to be_a(MMRHistory)
    end

    it 'contains mmr data' do
      expect(mmr_history.data.length).to be > 0
    end

    it 'mmr data is a MMRV1 object' do
      expect(mmr_history.data[0]).to be_a(MMRV1)
    end
  end

  describe '#mmr_history_by_puuid', mmr_history_by_puuid: true do
    let(:mmr_history_puuid) { api.mmr_history_by_puuid('140479d6-a2e5-5ca2-99d5-635b4d34b66c') }

    it 'takes 2 parameters' do
      expect((ValorantAPI.allocate.method(:mmr_history_by_puuid).parameters.flatten - %i[req opt key]).count).to eq(2)
    end

    it 'is a MMRHistory object' do
      expect(mmr_history_puuid).to be_a(MMRHistory)
    end

    it 'contains mmr data' do
      expect(mmr_history_puuid.data.length).to be > 0
    end

    it 'mmr data is a MMRV1 object' do
      expect(mmr_history_puuid.data[0]).to be_a(MMRV1)
    end
  end

  describe '#server_status', server_status: true do
    it 'takes 1 parameter' do
      expect((ValorantAPI.allocate.method(:server_status).parameters.flatten - %i[req opt key]).count).to eq(1)
    end

    it 'returns a hash' do
      expect(api.server_status('eu')).to be_a(Hash)
    end

    it 'has a matching region' do
      expect(api.server_status('eu').keys).to eq(%i[maintenances incidents])
    end
  end

  describe '#fetch_resposne', fetch_resposne: true do
    it 'returns a hash' do
      expect(api.send(:fetch_resposne, 'v1/account/jaredthejelly/yours')).to be_a(Hash)
    end
  end

  describe '#validate_response', validate_response: true do
    it 'raises an error if the response.code is not 200' do
      expect { api.send(:validate_response, { 'status' => 400, 'message' => 'Error' }) }.to raise_error(RuntimeError)
    end
  end

  describe '#validate_filter', validate_filter: true do
    it 'raises error if filter invalid' do
      expect { api.send(:validate_filter, 'notAFilter') }.to raise_error(RuntimeError)
    end

    it 'returns filter if valid' do
      expect(api.send(:validate_filter, 'competitive')).to eq('competitive')
    end

    it 'returns nil if no filter' do
      expect(api.send(:validate_filter, '')).to eq(nil)
    end
  end
end
