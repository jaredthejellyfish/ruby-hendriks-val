# frozen_string_literal: false

require 'date'
# This class is used to get the data for web articles.
class Article
  attr_reader :banner_url, :category, :date, :external_link, :title, :url

  def initialize(data)
    @banner_url = data['banner_url']
    @category = data['category']
    @date = Date.parse(data['date'])
    @external_link = data['external_link']
    @title = data['title']
    @url = data['url']
  end
end
