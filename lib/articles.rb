# frozen_string_literal: false

require_relative 'article'
# This class is used to store the data for web articles.
class Articles
  attr_reader :articles

  def initialize(hash)
    data = hash['data']
    @articles = data.each_with_object([]) do |article, arr|
      arr << Article.new(article)
    end
  end
end
