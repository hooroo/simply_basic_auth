require 'yaml'
require 'active_support/concern'
require 'action_controller/metal/http_authentication'


module SimpleRailsAuth
  module HttpAuthenticator
    extend ActiveSupport::Concern
    include ActionController::HttpAuthentication::Basic::ControllerMethods

    included do
      before_filter :authenticate!
    end

    def authenticate!
      authenticate_or_request_with_http_basic do |username, password|
        valid_user?(username, password)
      end
    end

    private

    def valid_user?(username, password)
      username.length > 0 && password.length > 0 &&
        http_basic_users[username] == password
    end

    def http_basic_users
      YAML.load_file(http_basic_users_file).with_indifferent_access[Rails.env]
    end

    def http_basic_users_file
      SimpleRailsAuth.configuration.users_file
    end

  end
end
