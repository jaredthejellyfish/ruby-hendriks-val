require 'json'

file = File.read(File.dirname(__FILE__) + '/helpers/mmr_v1.json')
data_hash = JSON.parse(file)

RSpec.describe MMRV1 do
  let(:mmr_v1) { MMRV1.new(data_hash) }

  describe '#initialize' do
    it 'takes one parameter' do
      initialize_parameters_count = MMRV1.allocate.method(:initialize).arity
      expect(initialize_parameters_count).to eq 1
    end

    it 'sets all the instance variables' do
      nil_vars = mmr_v1.instance_variables.sort.each_with_object([]) do |variable, array|
        array << variable if mmr_v1.instance_variable_get(variable).nil?
      end
      expect(nil_vars).to be_empty
    end

    it "doesn't let any of the instance variables be modified" do
      expect { mmr_v1.currenttier = 'notArealName' }.to raise_error(NoMethodError)
    end
  end

  describe '#instance_variable_strings' do
    it '@currenttierpatched is a string' do
      expect(mmr_v1.currenttierpatched).to be_a(String)
    end

    it '@name is a string' do
      expect(mmr_v1.name).to be_a(String)
    end

    it '@tag is a string' do
      expect(mmr_v1.tag).to be_a(String)
    end
  end

  describe '#instance_variable_integers' do
    it '@currenttier is an integer' do
      expect(mmr_v1.currenttier).to be_a(Integer)
    end

    it '@ranking_in_tier is an integer' do
      expect(mmr_v1.ranking_in_tier).to be_a(Integer)
    end

    it '@mmr_change_to_last_game is an integer' do
      expect(mmr_v1.mmr_change_to_last_game).to be_a(Integer)
    end

    it '@elo is an integer' do
      expect(mmr_v1.elo).to be_a(Integer)
    end
  end

  describe '#instance_variable_booleans' do
    it '@old is a boolean' do
      expect(mmr_v1.old).to be(true).or be(false)
    end
  end

  describe '#instance_variable_hashes' do
    it '@images is a hash' do
      expect(mmr_v1.images).to be_a(Hash)
    end
  end

  describe '#instance_variable_dates' do
    it '@date is a date' do
      expect(mmr_v1.date).to be_a(Time)
    end
  end
end
