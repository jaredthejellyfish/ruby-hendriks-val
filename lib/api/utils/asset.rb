# frozen_string_literal: true

# This class is used to create an Asset object
class Asset
  attr_reader :name, :id, :asset_name, :localized_names, :type

  def initialize(data, type)
    @data = data
    @type = type
    @name = @data['name']
    @id = @data['id']
    @asset_name = @data['assetName']

    fetch_localized_names
    remove_instance_variable(:@data)
  end

  private

  def fetch_localized_names
    @localized_names = @data['localizedNames'].transform_keys(&:to_sym)
  end
end
