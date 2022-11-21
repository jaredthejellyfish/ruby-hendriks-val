# frozen_string_literal: true

RSpec.describe Valorant::AccountStats, account: true do
  let(:client) { Valorant::AccountStats }
  let(:account_data) { client.account_data('jaredthejelly', 'yours') }

  describe '#account_data' do
    it 'takes 2 parameters' do
      expect((Valorant::AccountStats.method(:account_data).parameters.flatten - [:req]).count).to eq(2)
    end

    it 'is a User object' do
      expect(account_data).to be_a(User)
    end

    it 'has a matching name, tag & region' do
      expect(account_data.name).to eq('jaredthejelly')
      expect(account_data.tag).to eq('yours')
      expect(account_data.region).to eq('eu')
    end
  end
end
