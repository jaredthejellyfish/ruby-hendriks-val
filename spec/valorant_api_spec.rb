require 'rest-client'
require 'json'

begin
  require 'valorant_api'
rescue LoadError
end

describe ValorantAPI do
  let(:api) { ValorantAPI.new }

  describe '#account_data' do
    let(:account_data) { api.account_data('jaredthejelly', 'yours') }

    it 'is a User object' do
      expect(account_data).to be_a(User)
    end

    it 'has a matching name, tag & region' do
      expect(account_data.name).to eq('jaredthejelly')
      expect(account_data.tag).to eq('yours')
      expect(account_data.region).to eq('eu')
    end
  end

  describe '#match_data' do
    let(:match_data) { api.match_data('97d9ee21-71c4-4b27-805a-57cf614b89f5') }

    it 'is a Match object' do
      expect(match_data).to be_a(Match)
    end

    it 'has a matching id' do
      expect(match_data.matchid).to eq('97d9ee21-71c4-4b27-805a-57cf614b89f5')
    end
  end

  describe '#match_history' do
    let(:match_history) { api.match_history('jaredthejelly', 'yours') }

    it 'is a MatcheshHistory object' do
      expect(match_history).to be_a(MatcheshHistory)
      expect(match_history.matches[0]).to be_a(Match)
      expect(match_history.matches[0].all_players[0]).to be_a(Player)
    end

    it 'contains matches' do
      expect(match_history.matches.length).to be > 0
    end

    it 'matches contain players' do
      expect(match_history.matches[0].all_players.length).to be > 0
    end
  end

  describe '#match_history_by_puuid' do
    let(:match_histor_puuid) { api.match_history_by_puuid('140479d6-a2e5-5ca2-99d5-635b4d34b66c') }
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

  describe '#mmr_data' do
    let(:mmr_data) { api.mmr_data('jaredthejelly', 'yours') }
    it 'is a MMRV1 object' do
      expect(mmr_data).to be_a(MMRV1)
    end

    it 'has a matching name, tag & region' do
      expect(mmr_data.name).to eq('jaredthejelly')
      expect(mmr_data.tag).to eq('yours')
    end
  end

  describe '#mmr_data_by_puuid' do
    let(:mmr_data_puuid) { api.mmr_data_by_puuid('140479d6-a2e5-5ca2-99d5-635b4d34b66c') }
    it 'is a MMRV1 object' do
      expect(mmr_data_puuid).to be_a(MMRV1)
    end
  end

  describe '#mmr_history' do
    let(:mmr_history) { api.mmr_history('jaredthejelly', 'yours') }
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

  describe '#mmr_history_by_puuid' do
    let(:mmr_history_puuid) { api.mmr_history_by_puuid('140479d6-a2e5-5ca2-99d5-635b4d34b66c') }
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
