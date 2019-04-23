require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cofo
  class Application < Rails::Application
    config.load_defaults 5.1
    config.active_record.default_timezone = :local
    config.time_zone = 'Beijing'
    config.i18n.default_locale = :zh
    config.autoload_paths += Dir["#{config.root}/lib"]
    config.active_job.queue_adapter = :sidekiq
    config.assets.js_compressor = :uglifier
    config.assets.css_compressor = :sass
    config.generators do |g|
      g.assets false
      g.stylesheets false
      g.helper false
      g.fixture_replacement :factory_girl
    end
  end
end
