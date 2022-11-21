require 'json'

file = File.read("#{File.dirname(__FILE__)}/helpers/player.json")
data_hash = JSON.parse(file)

RSpec.describe Player do
  let(:player) { Player.new(data_hash) }

  describe '#initialize' do
    it 'takes one parameter' do
      initialize_parameters_count = Player.allocate.method(:initialize).arity
      expect(initialize_parameters_count).to eq 1
    end

    it 'sets the instance variables' do
      nil_vars = player.instance_variables.sort.each_with_object([]) do |variable, array|
        array << variable if player.instance_variable_get(variable).nil?
      end
      expect(nil_vars).to be_empty
    end

    it "doesn't let any of the instance variables be modified" do
      expect { player.name = 'notArealName' }.to raise_error(NoMethodError)
    end

    it 'has the correct amount of instance variables' do
      expect(player.instance_variables.count).to eq 28
    end

    it 'has the correct instance variables' do
      instance_variables = %w[puuid name tag team level character currenttier currenttier_patched party_id player_card
                              player_title assetss_card assetss_agent session_playtime behavior ability_casts score
                              kills deaths assists bodyshots headshots legshots spent_overall spent_average damage_made
                              damage_received]
      expect(player.instance_variables.sort).to include(instance_variables.map { |var| "@#{var}".to_sym }[0])
    end
  end

  describe '#instance_variable_strings' do
    it '@puuid is a string' do
      expect(player.puuid).to be_a(String)
    end

    it '@name is a string' do
      expect(player.name).to be_a(String)
    end

    it '@tag is a string' do
      expect(player.tag).to be_a(String)
    end

    it '@team is a string' do
      expect(player.team).to be_a(String)
    end

    it '@character is a string' do
      expect(player.character).to be_a(String)
    end

    it '@currenttier_patched is a string' do
      expect(player.currenttier_patched).to be_a(String)
    end

    it '@party_id is a string' do
      expect(player.party_id).to be_a(String)
    end

    it '@player_card is a string' do
      expect(player.player_card).to be_a(String)
    end

    it '@player_title is a string' do
      expect(player.player_title).to be_a(String)
    end
  end
  describe '#instance_variable_hash' do
    it '@assetss_card is a hash' do
      expect(player.assets_card).to be_a(Hash)
      expect(player.assets_card).to include(:large, :wide, :small)
    end

    it '@assetss_agent is a hash' do
      expect(player.assets_agent).to be_a(Hash)
      expect(player.assets_agent).to include(:small, :bust, :full, :killfeed)
    end
    it '@behavior is a hash' do
      expect(player.behavior).to be_a(Hash)
      expect(player.behavior).to include(:afk_rounds, :friendly_fire, :rounds_in_spawn)
    end

    it '@ability_casts is a hash' do
      expect(player.ability_casts).to be_a(Hash)
      expect(player.ability_casts).to include(:c_cast, :e_cast, :q_cast, :x_cast)
    end
  end
  describe '#instance_variable_integer' do
    it '@session_playtime is an integer' do
      expect(player.session_playtime).to be_a(Integer)
    end

    it '@level is an integer' do
      expect(player.level).to be_a(Integer)
    end
    it '@currenttier is an integer' do
      expect(player.currenttier).to be_a(Integer)
    end
    it '@score is an integer' do
      expect(player.score).to be_a(Integer)
    end

    it '@kills is an integer' do
      expect(player.kills).to be_a(Integer)
    end

    it '@deaths is an integer' do
      expect(player.deaths).to be_a(Integer)
    end

    it '@assists is an integer' do
      expect(player.assists).to be_a(Integer)
    end

    it '@bodyshots is an integer' do
      expect(player.bodyshots).to be_a(Integer)
    end

    it '@headshots is an integer' do
      expect(player.headshots).to be_a(Integer)
    end

    it '@legshots is an integer' do
      expect(player.legshots).to be_a(Integer)
    end

    it '@spent_overall is an integer' do
      expect(player.spent_overall).to be_a(Integer)
    end

    it '@spent_average is an integer' do
      expect(player.spent_average).to be_a(Integer)
    end

    it '@damage_made is an integer' do
      expect(player.damage_made).to be_a(Integer)
    end

    it '@damage_received is an integer' do
      expect(player.damage_received).to be_a(Integer)
    end
  end
end
