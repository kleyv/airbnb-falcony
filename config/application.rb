require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AirbnbFalcony
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.to_prepare do
    Devise::SessionsController.layout "log_in_layout"
    Devise::RegistrationsController.layout "log_in_layout"
    Devise::ConfirmationsController.layout "log_in_layout"
    Devise::UnlocksController.layout "log_in_layout"
    Devise::PasswordsController.layout "log_in_layout"
end
  end
end
