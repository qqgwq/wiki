require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wiki
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = "zh-CN"
    config.active_job.queue_adapter = :sidekiq
    CONFIG = Rails.application.secrets
    config.active_record.default_timezone = :local
    config.time_zone = 'Beijing'
    ActiveSupport::Deprecation.debug = true
  end
end
