require 'json'

begin
  require 'match'
rescue LoadError
end

file = File.read(File.dirname(__FILE__) + '/helpers/match.json')
data_hash = JSON.parse(file)

describe Match do
  let(:match) { Match.new(data_hash) }

  describe '#initialize' do
    it 'should take one parameter' do
      initialize_parameters_count = Match.allocate.method(:initialize).arity
      expect(initialize_parameters_count).to eq 1
    end

    it 'should set the instance variables' do
      nil_vars = match.instance_variables.sort.each_with_object([]) do |variable, array|
        array << variable if match.instance_variable_get(variable).nil?
      end

      expect(nil_vars).to be_empty
    end

    it 'should not let any of the instance variables be modified' do
      expect { match.game_version = '1.0' }.to raise_error(NoMethodError)
    end

    it 'should have the correct amount of instance variables' do
      expect(match.instance_variables.count).to eq 24
    end

    it 'should have the correct instance variables' do
      instance_vars = %w[game_version game_start_patched season_id platform region cluster map mode
                         queue rounds_played matchid game_length game_start red_team blue_team num_rounds
                         winning_team red_rounds_won red_rounds_lost blue_rounds_won blue_rounds_lost]

      expect(match.instance_variables.sort).to include(instance_vars.map { |var| "@#{var}".to_sym }[0])
    end
  end

  # MVP method tests
  describe '#mvp' do
    it 'should return a Player object' do
      expect(match.mvp).to be_a(Player)
    end

    it 'should return the player with the highest score' do
      expect(match.mvp.name).to eq('jaredthejelly')
    end
  end

  describe '#mvp_red' do
    it 'should return a Player object' do
      expect(match.mvp_red).to be_a(Player)
    end

    it 'should return the player with the highest score on the red team' do
      expect(match.mvp_red.name).to eq('jaredthejelly')
    end
  end

  describe '#mvp_blue' do
    it 'should return a Player object' do
      expect(match.mvp_blue).to be_a(Player)
    end

    it 'should return the player with the highest score on the blue team' do
      expect(match.mvp_blue.name).to eq('ブラックカイザー')
    end
  end

  # All players
  describe '#all_players' do
    it 'should return an array of Player objects' do
      expect(match.all_players).to be_a(Array)
      expect(match.all_players.first).to be_a(Player)
    end
  end

  # Instance variable string tests
  describe '#instance_variable_strings' do
    it '@game_version should return a string' do
      expect(match.game_version).to be_a(String)
    end

    it '@game_start_patched should return a string' do
      expect(match.game_start_patched).to be_a(String)
    end

    it '@season_id should return a string' do
      expect(match.season_id).to be_a(String)
    end

    it '@platform should return a string' do
      expect(match.platform).to be_a(String)
    end

    it '@region should return a string' do
      expect(match.region).to be_a(String)
    end

    it '@cluster should return a string' do
      expect(match.cluster).to be_a(String)
    end

    it '@map should return a string' do
      expect(match.map).to be_a(String)
    end

    it '@mode should return a string' do
      expect(match.mode).to be_a(String)
    end

    it '@queue should return a string' do
      expect(match.queue).to be_a(String)
    end

    it '@winning_team should return a string' do
      expect(match.winning_team).to be_a(String)
    end

    it '@matchid should return a string' do
      expect(match.matchid).to be_a(String)
    end
  end

  # Instance variable integer tests
  describe '#instance_variable_integers' do
    it '@rounds_played should return an integer' do
      expect(match.rounds_played).to be_a(Integer)
    end

    it '@game_length should return an integer' do
      expect(match.game_length).to be_a(Integer)
    end

    it '@game_start should return an integer' do
      expect(match.game_start).to be_a(Integer)
    end

    it '@num_rounds should return an integer' do
      expect(match.num_rounds).to be_a(Integer)
    end

    it '@red_rounds_won should return an integer' do
      expect(match.red_rounds_won).to be_a(Integer)
    end

    it '@red_rounds_lost should return an integer' do
      expect(match.red_rounds_lost).to be_a(Integer)
    end

    it '@blue_rounds_won should return an integer' do
      expect(match.blue_rounds_won).to be_a(Integer)
    end

    it '@blue_rounds_lost should return an integer' do
      expect(match.blue_rounds_lost).to be_a(Integer)
    end
  end

  # Instance variable array tests
  describe '#instance_variable_arrays' do
    it '@red_team should return an array of Player objects' do
      expect(match.red_team).to be_a(Array)
      expect(match.red_team.first).to be_a(Player)
    end

    it '@blue_team should return an array of Player objects' do
      expect(match.blue_team).to be_a(Array)
      expect(match.blue_team.first).to be_a(Player)
    end
  end
end
