# frozen_string_literal: true

RSpec.describe Valorant::Api do
  it "has a version number" do
    expect(Valorant::Api::VERSION).not_to be nil
  end
end
