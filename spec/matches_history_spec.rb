require 'json'

begin
  require 'matches_history'
rescue LoadError
end

file = File.read('/Users/gerardhernandez/code/ruby-hendriks-val/spec/helpers/matches_history.json')
data_hash = JSON.parse(file)

describe MatcheshHistory do
  let(:history) { MatcheshHistory.new(data_hash) }

  describe '#matches' do
    it 'is an array' do
      expect(history.matches).to be_a(Array)
    end

    it 'of Match objects' do
      expect(history.matches[0]).to be_a(Match)
    end
  end
end
