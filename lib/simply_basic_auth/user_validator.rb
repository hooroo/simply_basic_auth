require 'simply_basic_auth/yaml_reader'


module SimplyBasicAuth
  module UserValidator

    def valid_user?(username, password, context)
      username.length > 0 && password.length > 0 &&
        users(context)[username] == password
    end

  end
end
