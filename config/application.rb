require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Britoimoveis
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    
    config.i18n.available_locales = [:en, :"pt-BR"]
    config.i18n.default_locale = :"pt-BR"

    config.encoding = "utf-8"

    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.paths << Rails.root.join("app", "assets", "fonts", "website", "admin")
    config.assets.precompile += ["application-admin.css", "application-admin.js","application-website.css", "application-website.js"] 


    config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => "gmail.com",
      :user_name            => "contatobritoimoveis@gmail.com",
      :password             => "contato2014",
      :authentication       => :plain,
      :enable_starttls_auto => true
    }

    config.action_mailer.default_url_options = {
      :host => "yourdomain.dev"
    }

  end
end
