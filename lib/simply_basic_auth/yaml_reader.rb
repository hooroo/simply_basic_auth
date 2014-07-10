require 'yaml'
require 'simply_basic_auth'

module SimplyBasicAuth
  module YamlReader
    def users(context)
      YAML.load_file(users_file)[context]
    end

    private

    def users_file
      SimplyBasicAuth.configuration.users_file
    end
  end
end
