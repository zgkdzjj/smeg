source 'https://rubygems.org'

ruby '2.4.1'

gem 'rails', '~> 5.0.2'
gem 'puma', '~> 3.0'
gem 'pg', '~> 0.18'
gem 'foreman'

# version history
gem 'paper_trail'

# Assets Manager
gem "sass-rails", "~> 5.0"
gem 'uglifier', '>= 1.3.0'
gem "jquery-rails"
gem "bootstrap-sass", '~> 3.3.6'
gem "sass-json-vars"
gem "webpacker", "~> 3.0"

gem 'friendly_id', '~> 5.1.0'

# Email Assets
gem 'premailer-rails'

# PDF Generation
gem 'prawn', '~> 1.0.0'
gem 'prawn-table', '~> 0.2.0'
gem 'combine_pdf'
gem 'pdf-reader'
gem 'grim'

# Templating & UI
gem 'slim-rails', '3.1.1'
gem 'simple_form'
gem "cocoon"
gem 'bootstrap-kaminari-views'
gem 'truncate_html'
gem 'ckeditor'

gem 'jwt'
gem 'acts_as_list'

# Linking/Breadcrumbs
gem "breadcrumbs_on_rails"

# Javascript
gem 'gon'

# # Controller & Misc Utilities
gem 'high_voltage'
gem 'has_scope'
gem 'kaminari'                      # Pagination
gem 'pg_search'
gem 'friendly_id', '~> 5.1.0'
gem 'deterministic'

gem "roo", "~> 2.7.0"
gem 'smarter_csv'

# # Background Jobs & Task Runner
gem 'sinatra', git: 'https://github.com/sinatra/sinatra'
gem 'sidekiq'
gem 'whenever', :require => false

gem 'dotenv-rails'

# Nicer rails consoles
gem 'pry-rails'
gem 'pry-nav'
gem 'awesome_print'

# # Authentication and Authorization
gem 'devise'
gem 'devise_invitable', '~> 1.7.0'
gem "pundit"
gem "switch_user"

# # Images Upload
gem 'carrierwave', git: 'https://github.com/carrierwaveuploader/carrierwave'
gem 'fog'
gem 'fog-aws'
gem 'mini_magick'
gem 'file_validators'

# # Modelling Utilities
gem 'virtus'
gem 'state_machines-activerecord'
gem 'active_model_serializers'

# # Errors
gem "sentry-raven"                # Error Capture
gem 'gaffe'                       # Custom Error Pages

# # Here for seeding
gem 'factory_girl_rails'
gem 'ffaker'
gem "seedbank"

# JSONb Accessor
gem "jsonb_accessor", "~> 1.0.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'rails_12factor', group: "production"

# Grape API
gem 'kaminari-grape'
gem 'grape', '0.19.2'
gem 'grape-active_model_serializers'
gem 'grape-entity'
gem 'grape-swagger', github: 'ruby-grape/grape-swagger'
gem 'grape-swagger-entity'
gem 'grape-swagger-rails'
gem 'hashie-forbidden_attributes'
gem 'grape_has_scope'
gem 'grape-kaminari'
gem 'grape_logging'

group :development, :test do
  gem 'shoulda-matchers', '~> 3.1'

  gem 'rspec-rails', '~> 3.5'

  # Automation
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-zeus'
  gem 'guard-bundler'
  gem 'rb-fsevent'
  gem 'rspec-nc', require: false

  gem "better_errors"
  gem "binding_of_caller"

  # Deployment
  gem "mina", "~> 1.0.6",       require: false
  gem 'mina-multistage',        require: false
  gem 'mina-multi_server',      require: false
  gem 'mina-sitemap_generator', require: false
  gem "mina-webpacker",         require: false
  gem "mina-whenever",          require: false
end

group :development do
  # # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem "letter_opener"
  gem "bullet"
end

group :test do
  gem 'database_cleaner'
  gem 'capybara'
  gem 'poltergeist'
  gem 'capybara-screenshot'
  gem 'simplecov', :require => false
  gem "timecop"
  gem 'vcr'
  gem 'webmock'
  gem 'selenium-webdriver'
  gem 'pundit-matchers', '~> 1.0.1'
end
