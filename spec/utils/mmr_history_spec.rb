require 'json'

file = File.read(File.dirname(__FILE__) + '/helpers/mmr_history.json')
data_hash = JSON.parse(file)

RSpec.describe MMRHistory do
  let(:mmr_history) { MMRHistory.new(data_hash) }

  describe '#mmr' do
    it 'is an array' do
      expect(mmr_history.data).to be_a(Array)
    end

    it 'of MMRV1 objects' do
      expect(mmr_history.data[0]).to be_a(MMRV1)
    end
  end
end
