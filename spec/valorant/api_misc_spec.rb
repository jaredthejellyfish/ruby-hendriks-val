# frozen_string_literal: true

RSpec.describe Valorant::Misc, misc: true do
  let(:client) { Valorant::Misc }
  let(:articles) { client.articles }
  let(:leader_board) { client.leader_board }
  let(:content) { client.content }
  let(:server_status) { client.server_status('eu') }

  describe '#articles', articles: true do
    it 'takes 2 parameters' do
      expect((Valorant::Misc.method(:articles).parameters.flatten - %i[req opt key]).count).to eq(2)
    end

    it 'is an Articles object' do
      expect(articles).to be_a(Articles)
    end

    it 'contains articles' do
      expect(articles.articles.length).to be > 0
    end
  end

  describe '#leader_board', leader_board: true do
    it 'takes 2 parameters' do
      expect((Valorant::Misc.method(:leader_board).parameters.flatten - %i[req opt key]).count).to eq(3)
    end

    it 'is a Leaderboard object' do
      expect(leader_board).to be_a(LeaderBoard)
    end

    it 'contains leaders' do
      expect(leader_board.leaders.length).to be > 0
    end

    it 'leaders are Leader objects' do
      expect(leader_board.leaders[0]).to be_a(Leader)
    end
  end

  describe '#content', content: true do
    it 'takes 0 parameters' do
      expect((Valorant::Misc.method(:content).parameters.flatten - %i[req opt key]).count).to eq(0)
    end

    it 'is a Hash object' do
      expect(content).to be_a(Hash)
    end

    it 'contains content' do
      expect(content.length).to be > 0
    end
  end

  describe '#server_status', server_status: true do
    it 'takes 1 parameter' do
      expect((Valorant::Misc.method(:server_status).parameters.flatten - %i[req opt key]).count).to eq(1)
    end

    it 'returns a hash' do
      expect(server_status).to be_a(Hash)
    end

    it 'has a matching region' do
      expect(server_status.keys).to eq(%i[maintenances incidents])
    end
  end
end
