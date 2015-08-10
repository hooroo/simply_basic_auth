ENV['RACK_ENV'] = 'test'

require 'bundler'
require 'bundler/setup'
Bundler.setup
require 'pry'
require 'simply_basic_auth'

RSpec.configure do |config|
  # some (optional) config here
end
