require 'simply_basic_auth/yaml_reader'
require 'simply_basic_auth/user_validator'
require 'rack/auth/basic'

module SimplyBasicAuth
  module Rack
    class HttpAuthenticator

      include SimplyBasicAuth::YamlReader
      include SimplyBasicAuth::UserValidator

      def initialize(app, realm=nil)
        @app = app
        @realm = realm
      end

      def call(env)
        authenticator.call(env)
      end

      private

      def authenticator
        ::Rack::Auth::Basic.new(@app, @realm) do |username, password|
          valid_user?(username, password, ENV['RACK_ENV'])
        end
      end

    end
  end
end
