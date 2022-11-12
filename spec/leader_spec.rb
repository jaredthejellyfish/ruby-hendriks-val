require 'json'

begin
  require 'leader'
rescue LoadError
end

file = File.read(File.dirname(__FILE__) + '/helpers/leader.json')
data_hash = JSON.parse(file)

describe Leader do
  let(:leader) { Leader.new(data_hash) }

  describe '#initialize', leader: true do
    it 'takes one parameter' do
      initialize_parameters_count = Leader.allocate.method(:initialize).arity
      expect(initialize_parameters_count).to eq 1
    end

    it 'sets the instance variables' do
      nil_vars = leader.instance_variables.sort.each_with_object([]) do |variable, array|
        array << variable if leader.instance_variable_get(variable).nil?
      end
      expect(nil_vars).to be_empty
    end

    it "doesn't let any of the instance variables be modified" do
      expect { leader.name = 'notArealName' }.to raise_error(NoMethodError)
    end

    it 'has the correct amount of instance variables' do
      expect(leader.instance_variables.count).to eq 11
    end

    it 'has the correct instance variables' do
      expect(leader.instance_variables).to eq %i[
        @leader_board_rank @ranked_rating @number_of_wins @comptetitive_tier @puuid @game_name @tag_line @player_card_id @title_id @is_banned @is_anonymized
      ]
    end
  end

  describe '#instance_variable_strings', focus: true do
    it '@puuid is a string' do
      expect(leader.puuid).to be_a(String)
    end

    it '@game_name is a string' do
      expect(leader.game_name).to be_a(String)
    end

    it '@tag_line is a string' do
      expect(leader.tag_line).to be_a(String)
    end

    it '@player_card_id is a string' do
      expect(leader.player_card_id).to be_a(String)
    end

    it '@title_id is a string' do
      expect(leader.title_id).to be_a(String)
    end
  end

  describe '#instance_variable_booleans', focus: true do
    it '@is_banned is a boolean' do
      expect(leader.is_banned).to be(true).or be(false)
    end

    it '@is_anonymized is a boolean' do
      expect(leader.is_anonymized).to be(true).or be(false)
    end
  end

  describe '#instance_variable_integers', focus: true do
    it '@leader_board_rank is an integer' do
      expect(leader.leader_board_rank).to be_a(Integer)
    end

    it '@ranked_rating is an integer' do
      expect(leader.ranked_rating).to be_a(Integer)
    end

    it '@number_of_wins is an integer' do
      expect(leader.number_of_wins).to be_a(Integer)
    end

    it '@comptetitive_tier is an integer' do
      expect(leader.comptetitive_tier).to be_a(Integer)
    end
  end
end
