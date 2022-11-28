# frozen_string_literal: true

require_relative 'asset'

# This class is used to create a Content object
class Content
  attr_reader :assets

  def initialize(data)
    @data = data
    @assets = fetch_assets
    remove_instance_variable(:@data)
  end

  def find_asset_by_name(name)
    @assets.find { |asset| asset.name == name }
  end

  def agent_images(name)
    agent = @assets.find { |asset| asset.name == name }
    { display_icon: "https://media.valorant-api.com/agents/#{agent.id}/displayicon.png",
      display_icon_small: "https://media.valorant-api.com/agents/#{agent.id}/displayiconsmall.png",
      bust_portrait: "https://media.valorant-api.com/agents/#{agent.id}/fullportrait.png",
      full_portrait: "https://media.valorant-api.com/agents/#{agent.id}/fullportrait.png",
      full_portrait_v2: "https://media.valorant-api.com/agents/#{agent.id}/fullportrait.png",
      killfeed_portrait: "https://media.valorant-api.com/agents/#{agent.id}/killfeedportrait.png",
      background: "https://media.valorant-api.com/agents/#{agent.id}/background.png" }
  end

  private

  def fetch_assets
    @assets = []
    @data.each_key do |type|
      next if type == 'version'

      @data[type].each do |asset|
        @assets << Asset.new(asset, type)
      end
    end
    @assets
  end
end
