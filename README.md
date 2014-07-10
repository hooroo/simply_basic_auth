SimplyBasicAuth
======

Gem for our simplistic HTTP Basic Auth layer

## Setup

1. Add `gem 'simply_basic_auth', git: 'git@github.com:hooroo/simply_basic_auth.git'` to your Gemfile
1. Run `bundle install`
1. Build a file containing desired usernames and passwords to be used for authenticating endpoints
1. If the file from the previous step was put in a non-standard location, then a simple initializer will be required

## Using SimplyBasicAuth

1. Add `require 'simply_basic_auth/rails/http_authenticator` to the file containing the controller you want to wrap with authentication
1. Add `include SimplyBasicAuth::Rails::HttpAuthenticator` to the Controller definition

## Config

You can optionally add something like the following to an initializer:

```ruby
require 'simply_basic_auth'

SimplyBasicAuth.configure do |config|
  config.users_file = File.join('path', 'to', 'custom', 'file', 'location.yml')
end
```

By default the users file is located at `config/simply_basic_auth.yml`

### SimplyBasicAuth File Format
```yaml
---
environment:
  username1: password1
  username2: password2
```
