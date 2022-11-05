require 'json'

begin
  require 'user'
rescue LoadError
end

file = File.read(File.dirname(__FILE__) + '/helpers/user.json')
data_hash = JSON.parse(file)

describe User do
  let(:user) { User.new(data_hash) }

  describe '#initialize' do
    it 'takes one parameter' do
      initialize_parameters_count = User.allocate.method(:initialize).arity
      expect(initialize_parameters_count).to eq 1
    end

    it 'sets the instance variables' do
      nil_vars = user.instance_variables.sort.each_with_object([]) do |variable, array|
        array << variable if user.instance_variable_get(variable).nil?
      end
      expect(nil_vars).to be_empty
    end

    it "doesn't let any of the instance variables be modified" do
      expect { user.name = 'notArealName' }.to raise_error(NoMethodError)
    end

    it 'has the correct amount of instance variables' do
      expect(user.instance_variables.count).to eq 8
    end

    it 'has the correct instance variables' do
      instance_variables = %w[puuid region name tag account_level card last_update last_update_raw]
      expect(user.instance_variables.sort).to include(instance_variables.map { |var| "@#{var}".to_sym }[0])
    end
  end

  describe '#instance_variable_strings' do
    it '@puuid is a string' do
      expect(user.puuid).to be_a(String)
    end

    it '@region is a string' do
      expect(user.region).to be_a(String)
    end

    it '@name is a string' do
      expect(user.name).to be_a(String)
    end

    it '@tag is a string' do
      expect(user.tag).to be_a(String)
    end

    it '@card is a string' do
      expect(user.card).to be_a(Hash)
    end

    it '@last_update is a string' do
      expect(user.last_update).to be_a(String)
    end

    it '@last_update_raw is a string' do
      expect(user.last_update_raw).to be_a(Integer)
    end

    it '@account_level is a string' do
      expect(user.account_level).to be_a(Integer)
    end
  end
end
