$elastic_search = Elasticsearch::Persistence::Repository.new do
  # Configure the Elasticsearch client
  client Elasticsearch::Client.new url: ENV['ELASTICSEARCH_URL'], log: true

  # Set a custom index name
  index :weather_app
end