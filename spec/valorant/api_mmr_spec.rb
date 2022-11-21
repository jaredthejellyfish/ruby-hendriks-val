# frozen_string_literal: true

RSpec.describe Valorant::MMRStats do
  let(:client) { Valorant::MMRStats }
  let(:mmr_data) { client.mmr_data('jaredthejelly', 'yours') }
  let(:mmr_data_by_puuid) { client.mmr_data_by_puuid('140479d6-a2e5-5ca2-99d5-635b4d34b66c') }
  let(:mmr_history) { client.mmr_history('jaredthejelly', 'yours') }
  let(:mmr_history_by_puuid) { client.mmr_history_by_puuid('140479d6-a2e5-5ca2-99d5-635b4d34b66c') }

  describe '#mmr_data', mmr_data: true do
    it 'takes 4 parameters' do
      expect((Valorant::MMRStats.method(:mmr_data).parameters.flatten - %i[req opt key]).count).to eq(4)
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
    it 'takes 3 parameters' do
      expect((Valorant::MMRStats.method(:mmr_data_by_puuid).parameters.flatten - %i[req opt
                                                                                    key]).count).to eq(3)
    end

    it 'is a MMRV1 object' do
      expect(mmr_data_by_puuid).to be_a(MMRV1)
    end
  end

  describe '#mmr_history', mmr_history: true do
    it 'takes 3 parameters' do
      expect((Valorant::MMRStats.method(:mmr_history).parameters.flatten - %i[req opt key]).count).to eq(3)
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
    it 'takes 2 parameters' do
      expect((Valorant::MMRStats.method(:mmr_history_by_puuid).parameters.flatten - %i[req opt
                                                                                       key]).count).to eq(2)
    end

    it 'is a MMRHistory object' do
      expect(mmr_history_by_puuid).to be_a(MMRHistory)
    end

    it 'contains mmr data' do
      expect(mmr_history_by_puuid.data.length).to be > 0
    end

    it 'mmr data is a MMRV1 object' do
      expect(mmr_history_by_puuid.data[0]).to be_a(MMRV1)
    end
  end
end
