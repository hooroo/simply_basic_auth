require 'simply_basic_auth/yaml_reader'
require 'simply_basic_auth/user_validator'
require 'active_controller/metal/http_authentication'

module SimplyBasicAuth
  module Rails
    module HttpAuthenticator
      include SimplyBasicAuth::YamlReader
      include SimplyBasicAuth::UserValidator
      include ActionController::HttpAuthentication::Basic::ControllerMethods

      included do
        before_filter :authenticate!
      end

      def authenticate!
        authenticate_or_request_with_http_basic do |username, password|
          valid_user?(username, password, Rails.env)
        end
      end

    end
  end
end
