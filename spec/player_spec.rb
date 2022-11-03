require 'json'

begin
  require 'player'
rescue LoadError
end

file = File.read(File.dirname(__FILE__) + '/helpers/player.json')
data_hash = JSON.parse(file)

describe Player do
  let(:player) { Player.new(data_hash) }

  describe '#initialize' do
    it 'should take one parameter' do
      initialize_parameters_count = Player.allocate.method(:initialize).arity
      expect(initialize_parameters_count).to eq 1
    end

    it 'should set the instance variables' do
      nil_vars = player.instance_variables.sort.each_with_object([]) do |variable, array|
        array << variable if player.instance_variable_get(variable).nil?
      end
      expect(nil_vars).to be_empty
    end

    it 'should not let any of the instance variables be modified' do
      expect { player.name = 'notArealName' }.to raise_error(NoMethodError)
    end

    it 'should have the correct amount of instance variables' do
      expect(player.instance_variables.count).to eq 28
    end

    it 'should have the correct instance variables' do
      instance_variables = %w[puuid name tag team level character currenttier currenttier_patched party_id player_card
                              player_title assets_card assets_agent session_playtime behavior ability_casts score kills
                              deaths assists bodyshots headshots legshots spent_overall spent_average damage_made damage
                              received]
      expect(player.instance_variables.sort).to include(instance_variables.map { |var| "@#{var}".to_sym }[0])
    end
  end

  describe '#instance_variable_strings' do
    it '@puuid should return a string' do
      expect(player.puuid).to be_a(String)
    end

    it '@name should return a string' do
      expect(player.name).to be_a(String)
    end

    it '@tag should return a string' do
      expect(player.tag).to be_a(String)
    end

    it '@team should return a string' do
      expect(player.team).to be_a(String)
    end

    it '@character should return a string' do
      expect(player.character).to be_a(String)
    end

    it '@currenttier_patched should return a string' do
      expect(player.currenttier_patched).to be_a(String)
    end

    it '@party_id should return a string' do
      expect(player.party_id).to be_a(String)
    end

    it '@player_card should return a string' do
      expect(player.player_card).to be_a(String)
    end

    it '@player_title should return a string' do
      expect(player.player_title).to be_a(String)
    end
  end
  describe '#instance_variable_hash' do
    it '@assets_card should return a string' do
      expect(player.assets_card).to be_a(Hash)
      expect(player.assets_card).to include(:large, :wide, :small)
    end

    it '@assets_agent should return a string' do
      expect(player.assets_agent).to be_a(Hash)
      expect(player.assets_agent).to include(:small, :bust, :full, :killfeed)
    end
    it '@behavior should return a string' do
      expect(player.behavior).to be_a(Hash)
      expect(player.behavior).to include(:afk_rounds, :friendly_fire, :rounds_in_spawn)
    end

    it '@ability_casts should return a string' do
      expect(player.ability_casts).to be_a(Hash)
      expect(player.ability_casts).to include(:c_cast, :e_cast, :q_cast, :x_cast)
    end
  end
  describe '#instance_variable_integer' do
    it '@session_playtime should return a string' do
      expect(player.session_playtime).to be_a(Integer)
    end

    it '@level should return a string' do
      expect(player.level).to be_a(Integer)
    end
    it '@currenttier should return a string' do
      expect(player.currenttier).to be_a(Integer)
    end
    it '@score should return a string' do
      expect(player.score).to be_a(Integer)
    end

    it '@kills should return a string' do
      expect(player.kills).to be_a(Integer)
    end

    it '@deaths should return a string' do
      expect(player.deaths).to be_a(Integer)
    end

    it '@assists should return a string' do
      expect(player.assists).to be_a(Integer)
    end

    it '@bodyshots should return a string' do
      expect(player.bodyshots).to be_a(Integer)
    end

    it '@headshots should return a string' do
      expect(player.headshots).to be_a(Integer)
    end

    it '@legshots should return a string' do
      expect(player.legshots).to be_a(Integer)
    end

    it '@spent_overall should return a string' do
      expect(player.spent_overall).to be_a(Integer)
    end

    it '@spent_average should return a string' do
      expect(player.spent_average).to be_a(Integer)
    end

    it '@damage_made should return a string' do
      expect(player.damage_made).to be_a(Integer)
    end

    it '@damage_received should return a string' do
      expect(player.damage_received).to be_a(Integer)
    end
  end
end
