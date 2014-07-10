require 'yaml'
require 'naught'
require 'simply_basic_auth'

module SimplyBasicAuth
  module YamlReader

    NullObject = Naught.build

    def users(environment)
      users_hash[environment]
    end

    private

    def users_hash
      return @users_hash if @users_hash
      @users_hash = YAML.load_file(users_file)
      @users_hash.default = NullObject.new
      @users_hash
    end

    def users_file
      SimplyBasicAuth.configuration.users_file
    end
  end
end
