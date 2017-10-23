require './config/initializers/elastic_search'

class ImportCities
  def self.bulk_import
    file = File.read('data/city.list.json')
    city_arr = JSON.parse(file)

    city_arr.each_slice(1000) do |cities|
      cities_data = cities.map { |city| city = { index: { data: city } } }
      $elastic_search.client.bulk index: 'weather_app', type: 'city', body: cities_data
    end
  end   
end