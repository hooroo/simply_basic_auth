# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simply_basic_auth/version'

Gem::Specification.new do |spec|
  spec.name          = "simply_basic_auth"
  spec.version       = SimplyBasicAuth::VERSION
  spec.authors       = ['Brett Wilkins']
  spec.email         = ['brett@hooroo.com']
  spec.summary       = %q{A simple HTTP Basic Authentication mixin}
  spec.description   = %q{A simple HTTP Basic Authentication mixin}
  spec.homepage      = "https://github.com/hooroo/simply_basic_auth"
  spec.license       = ""

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'naught', '1.0.0'

  spec.add_development_dependency 'pry', '~> 0.9'
  spec.add_development_dependency 'bundler', "~> 2.0.1"
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rack'
  spec.add_development_dependency 'rack-test'
end
