# frozen_string_literal: true

require 'json'

file = File.read(File.dirname(__FILE__) + '/helpers/article.json')
data_hash = JSON.parse(file)

RSpec.describe Article do
  let(:article) { Article.new(data_hash) }

  describe '#initialize' do
    it 'takes one parameter' do
      initialize_parameters_count = Article.allocate.method(:initialize).arity
      expect(initialize_parameters_count).to eq 1
    end

    it 'sets the instance variables' do
      nil_vars = article.instance_variables.sort.each_with_object([]) do |variable, array|
        array << variable if article.instance_variable_get(variable).nil?
      end
      expect(nil_vars).to be_empty
    end

    it "doesn't let any of the instance variables be modified" do
      expect { article.banner_url = 'notArealName' }.to raise_error(NoMethodError)
    end

    it 'has the correct amount of instance variables' do
      expect(article.instance_variables.count).to eq 6
    end
  end

  describe '#instance_variable_strings' do
    it '@banner_url is a string' do
      expect(article.banner_url).to be_a(String)
    end

    it '@category is a string' do
      expect(article.category).to be_a(String)
    end

    it '@external_link is a string' do
      expect(article.external_link).to be_a(String)
    end

    it '@title is a string' do
      expect(article.title).to be_a(String)
    end

    it '@url is a string' do
      expect(article.url).to be_a(String)
    end
  end

  describe '#instance_variable_dates' do
    it '@date is a date' do
      expect(article.date).to be_a(Date)
    end
  end
end
