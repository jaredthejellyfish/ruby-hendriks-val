require 'json'

file = File.read(File.dirname(__FILE__) + '/helpers/articles.json')
data_hash = JSON.parse(file)

RSpec.describe Articles do
  let(:online_articles) { Articles.new(data_hash) }

  describe '#articles' do
    it 'is an array' do
      expect(online_articles.articles).to be_a(Array)
    end

    it 'of Article objects' do
      expect(online_articles.articles[0]).to be_a(Article)
    end
  end
end
