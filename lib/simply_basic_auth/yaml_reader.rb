require 'yaml'
require 'simply_basic_auth'

module SimplyBasicAuth
  module YamlReader
    class << self
      def users
        YAML.load_file(users_file)[Rails.env]
      end

      private

      def users_file
        SimplyBasicAuth.configuration.users_file
      end
    end
  end
end
