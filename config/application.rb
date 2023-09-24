# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FromaRailsApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # デフォルト
    # config.time_zone = "Central Time (US & Canada)"
    # タイムゾーンを東京に変更
    config.time_zone = "Tokyo"
    # config.eager_load_paths << Rails.root.join("extras")
    # 言語を日本語に設定
    config.i18n.default_locale = :ja
  end
end
