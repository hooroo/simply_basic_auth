require 'simply_basic_auth/yaml_reader'


module SimplyBasicAuth
  module HttpAuthenticator

    def valid_user?(username, password)
      username.length > 0 && password.length > 0 &&
        users[username] == password
    end

  end
end
