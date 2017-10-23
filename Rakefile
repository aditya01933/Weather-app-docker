require_relative 'config/application'
require_relative 'lib/tasks/import_cities'

Rails.application.load_tasks

namespace :app_setup do
  desc 'Import all cities in batch'
  task :import_cities do
    ImportCities.bulk_import
  end
end