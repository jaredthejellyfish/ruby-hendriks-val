require 'json'

file = File.read(File.dirname(__FILE__) + '/helpers/leader_board.json')
data_hash = JSON.parse(file)

RSpec.describe LeaderBoard, focus: true do
  let(:leader_board) { LeaderBoard.new(data_hash) }

  describe '#leader_board' do
    it 'is an array' do
      expect(leader_board.leaders).to be_a(Array)
    end

    it 'of Leader objects' do
      expect(leader_board.leaders[0]).to be_a(Leader)
    end
  end
end
