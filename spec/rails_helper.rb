ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'factory_girl_rails'

require 'sidekiq/testing'
require 'simplecov'

SimpleCov.start do
  coverage_dir "./coverage"
end


FactoryGirl.definition_file_paths << File.expand_path("../factories", __FILE__)
FactoryGirl.reload

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.infer_spec_type_from_file_location!

  config.use_transactional_fixtures = true

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    Sidekiq::Testing.fake!
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.before(:each) do
    Sidekiq::Worker.clear_all
  end

  config.include FactoryGirl::Syntax::Methods
  # config.include RequestSpecHelper, type: :request
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  config.filter_rails_from_backtrace!
end
