# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_rails_auth/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_rails_auth"
  spec.version       = SimpleRailsAuth::VERSION
  spec.authors       = ['Brett Wilkins']
  spec.email         = ['brett@hooroo.com']
  spec.summary       = %q{A simple HTTP Basic Authentication mixin for Rails 3.2.x/4.x.}
  spec.description   = %q{A simple HTTP Basic Authentication mixin for Rails 3.2.x/4.x.}
  spec.homepage      = "https://github.com/hooroo/simple_rails_auth"
  spec.license       = ""

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activesupport', '>= 3.2'
  spec.add_runtime_dependency 'actionpack', '>= 3.2'

  spec.add_development_dependency 'pry', '~> 0.9'
  spec.add_development_dependency 'bundler', "~> 1.5"
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.14'
end
