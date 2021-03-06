# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'silent_listener/version'

Gem::Specification.new do |spec|
  spec.name          = "silent_listener"
  spec.version       = SilentListener::VERSION
  spec.authors       = ["samtgarson"]
  spec.email         = ["samtgarson@gmail.com"]

  spec.summary       = %q{Listen out for selectors and instantiate your classes.}
  spec.description   = %q{SilentListener allows you to define _SilentListeners_ which will be instantiated whenever an element appears which matches a given selector. It also comes with some handy functionality for reinstantiating classes using events, and handling class options.}
  spec.homepage      = "http://github.com/samtgarson/silent-listener"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency 'coffee-rails', '~> 4.1.0'
end
