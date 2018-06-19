require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Smeg
  class Application < Rails::Application
    config.i18n.enforce_available_locales = true
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    config.autoload_paths += %w(#{config.root}/app/models/ckeditor)
    config.autoload_paths += Dir[Rails.root.join("app", "models", "products")]

    config.autoload_paths += Dir["#{config.root}/lib"]
    config.autoload_paths += Dir[File.join(Rails.root, "lib", "core_ext", "*.rb")].each {|l| require l }

    # Required for ENUMS
    config.active_record.schema_format = :sql

    config.time_zone = 'Sydney'
  end
end
