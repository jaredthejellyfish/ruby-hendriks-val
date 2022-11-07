require 'json'

begin
  require 'mmr_history'
rescue LoadError
end

file = File.read('/Users/gerardhernandez/code/ruby-hendriks-val/spec/helpers/mmr_history.json')
data_hash = JSON.parse(file)

describe MMRHistory do
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
