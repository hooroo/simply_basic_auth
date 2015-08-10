module SimplyBasicAuth
  module UserValidator

    def valid_user?(username, password, environment)
      username.length > 0 && password.length > 0 &&
        users(environment)[username] == password
    end

  end
end
