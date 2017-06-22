require 'simply_basic_auth/yaml_reader'
require 'simply_basic_auth/user_validator'
require 'action_controller/metal/http_authentication'

module SimplyBasicAuth
  module Rails
    module HttpAuthenticator

      def self.included(base)
        base.send(:include, InstanceMethods)

        if base.respond_to?(:before_action)
          base.send(:before_action, :authenticate!)
        else
          base.send(:before_filter, :authenticate!)
        end
      end

      module InstanceMethods
        include SimplyBasicAuth::YamlReader
        include SimplyBasicAuth::UserValidator
        include ActionController::HttpAuthentication::Basic::ControllerMethods

        def authenticate!
          authenticate_or_request_with_http_basic do |username, password|
            valid_user?(username, password, ::Rails.env)
          end
        end
      end

    end
  end
end
