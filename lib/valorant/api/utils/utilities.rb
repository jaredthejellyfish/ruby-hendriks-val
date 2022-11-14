require 'json'
require 'rest-client'
require 'fast_jsonparser'

BASE_URL = 'https://api.henrikdev.xyz/valorant/'

def fetch_resposne(endpoint, validate: true)
  response = RestClient.get(BASE_URL + endpoint)
  return FastJsonparser.parse(validate_response(response), symbolize_keys: false) unless validate == false

  FastJsonparser.parse(response, symbolize_keys: false)
end

def validate_response(response)
  return response.body if response.code == 200

  raise "Error: #{response.code} - #{response['message']}"
end

def validate_filter(filter)
  return if filter.empty?

  filters = %w[escalation spikerush deathmatch competitive unrated replication game_updates dev esports
               announcments]
  raise "Error: Invalid filter. Valid filters are: #{filters.join(', ')}" unless filters.include?(filter)

  filter
end

def validate_locale(locale)
  return if locale.empty?

  locales = %w[en-us en-gb de-de es-es fr-fr it-it ru-ru tr-tr es-mx ja-jp ko-kr pt-br]
  raise "Error: Invalid locale. Valid locales are: #{locales.join(', ')}" unless locales.include?(locale)

  locale
end