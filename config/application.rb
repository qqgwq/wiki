require_relative 'boot'

require 'rails/all'
require 'csv'



# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wiki
  class Application < Rails::Application
    config.middleware.use Rack::Cors do
      allow do
        origins "*"
        resource "*", headers: :any, methods: [:get, :post, :put, :delete, :options]
      end
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
    
    config.i18n.default_locale = "zh-CN"
    config.active_job.queue_adapter = :sidekiq
    CONFIG = Rails.application.secrets
    config.time_zone = 'UTC'
    config.active_record.default_timezone = :utc
    ActiveSupport::Deprecation.debug = true

    config.filter_parameters << :password
    Raven.configure do |config|
      config.dsn = 'https://58387b6d97544bfe9dd1229971000def:737f4f4d0c7d49e28b9596bc6cffb5bb@sentry.io/1324971'
    end
  end
end
