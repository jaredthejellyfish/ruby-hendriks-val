require 'json'

file = File.read(File.dirname(__FILE__) + '/helpers/match.json')
data_hash = JSON.parse(file)

RSpec.describe Match do
  let(:match) { Match.new(data_hash) }

  describe '#initialize' do
    it 'takes one parameter' do
      initialize_parameters_count = Match.allocate.method(:initialize).arity
      expect(initialize_parameters_count).to eq 1
    end

    it 'sets the instance variables' do
      nil_vars = match.instance_variables.sort.each_with_object([]) do |variable, array|
        array << variable if match.instance_variable_get(variable).nil?
      end

      expect(nil_vars).to be_empty
    end

    it "doesn't let any of the instance variables be modified" do
      expect { match.game_version = '1.0' }.to raise_error(NoMethodError)
    end

    it 'has the correct amount of instance variables' do
      expect(match.instance_variables.count).to eq 24
    end

    it 'has the correct instance variables' do
      instance_vars = %w[game_version game_start_patched season_id platform region cluster map mode
                         queue rounds_played matchid game_length game_start red_team blue_team
                         winning_team red_rounds_won red_rounds_lost blue_rounds_won blue_rounds_lost]

      expect(match.instance_variables.sort).to include(instance_vars.map { |var| "@#{var}".to_sym }[0])
    end
  end

  # MVP method tests
  describe '#mvp' do
    it 'is a Player object' do
      expect(match.mvp).to be_a(Player)
    end

    it 'is the player with the highest score' do
      mvp = match.all_players.max_by(&:score)
      expect(match.mvp.name).to eq(mvp.name)
    end
  end

  describe '#mvp_red' do
    it 'is a Player object' do
      expect(match.mvp_red).to be_a(Player)
    end

    it 'is the player with the highest score on the red team' do
      mvp = match.red_team.max_by(&:score)
      expect(match.mvp_red.name).to eq(mvp.name)
    end
  end

  describe '#mvp_blue' do
    it 'is a Player object' do
      expect(match.mvp_blue).to be_a(Player)
    end

    it 'is the player with the highest score on the blue team' do
      mvp = match.blue_team.max_by(&:score)
      expect(match.mvp_blue.name).to eq(mvp.name)
    end
  end

  # All players
  describe '#all_players' do
    it 'is an array' do
      expect(match.all_players).to be_a(Array)
    end
    it 'of Player objects' do
      expect(match.all_players.first).to be_a(Player)
    end
  end

  # Instance variable string tests
  describe '#instance_variable_strings' do
    it '@game_version is a string' do
      expect(match.game_version).to be_a(String)
    end

    it '@game_start_patched is a string' do
      expect(match.game_start_patched).to be_a(String)
    end

    it '@season_id is a string' do
      expect(match.season_id).to be_a(String)
    end

    it '@platform is a string' do
      expect(match.platform).to be_a(String)
    end

    it '@region is a string' do
      expect(match.region).to be_a(String)
    end

    it '@cluster is a string' do
      expect(match.cluster).to be_a(String)
    end

    it '@map is a string' do
      expect(match.map).to be_a(String)
    end

    it '@mode is a string' do
      expect(match.mode).to be_a(String)
    end

    it '@queue is a string' do
      expect(match.queue).to be_a(String)
    end

    it '@winning_team is a string' do
      expect(match.winning_team).to be_a(String)
    end

    it '@matchid is a string' do
      expect(match.matchid).to be_a(String)
    end
  end

  # Instance variable integer tests
  describe '#instance_variable_integers' do
    it '@rounds_played is an integer' do
      expect(match.rounds_played).to be_a(Integer)
    end

    it '@game_length is an integer' do
      expect(match.game_length).to be_a(Integer)
    end

    it '@game_start is an integer' do
      expect(match.game_start).to be_a(Integer)
    end

    it '@red_rounds_won is an integer' do
      expect(match.red_rounds_won).to be_a(Integer)
    end

    it '@red_rounds_lost is an integer' do
      expect(match.red_rounds_lost).to be_a(Integer)
    end

    it '@blue_rounds_won is an integer' do
      expect(match.blue_rounds_won).to be_a(Integer)
    end

    it '@blue_rounds_lost is an integer' do
      expect(match.blue_rounds_lost).to be_a(Integer)
    end
  end

  # Instance variable array tests
  describe '#instance_variable_arrays' do
    it '@red_team is an array of Player objects' do
      expect(match.red_team).to be_a(Array)
      expect(match.red_team.first).to be_a(Player)
    end

    it '@blue_team is an array of Player objects' do
      expect(match.blue_team).to be_a(Array)
      expect(match.blue_team.first).to be_a(Player)
    end
  end
end
