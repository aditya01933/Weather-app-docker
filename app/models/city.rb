class City < ApplicationRecord
  include Elasticsearch::Persistence::Model

  attribute :id, Integer
  attribute :name,  String
  attribute :country,  String
  attribute :coord, Hash[Symbol => Float]

  def find_id
    city = es.search(query: { match: { name: self.name} }).first
    unless city
      errors.add(:city, 'not found')
      return self
    end

    self.id = city.id
    self
  end

  def fetch_weather
    return nil unless self.id

    Rails.cache.fetch self.id do
      call_openweather
    end
  end

  def call_openweather
    url = (ENV['OW_URL'] || '') + "?id=#{self.id}&APPID=" + (ENV['OW_APP_ID']  || '')
    
    response = HTTParty.get url
    if response.code != 200
      errors.add(:api_error, 'unable to fetch weather')
      return
    end
    
    weather = JSON.parse(response.body)
    weather['main']['temp']
  end
end