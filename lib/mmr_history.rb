require_relative 'mmr_v1'

# This class is used to get the data from the mmr history
class MMRHistory
  attr_reader :data

  def initialize(hash)
    @data = fetch_mmr_v1(hash['data'])
  end

  private

  def fetch_mmr_v1(mmr_v1_json)
    mmr_v1_json.each_with_object([]) do |mmr_v1, arr|
      reformated_data = { 'data' => mmr_v1 }
      arr << MMRV1.new(reformated_data)
    end
  end
end