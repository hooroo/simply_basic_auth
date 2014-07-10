require 'simply_basic_auth/version'

module SimplyBasicAuth
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  class Configuration
    attr_accessor :users_file

    def initialize
      @users_file = File.join('config', 'simply_basic_auth.yml')
    end
  end
end
