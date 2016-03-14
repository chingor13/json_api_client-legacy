# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json_api_client/legacy/version'

Gem::Specification.new do |spec|
  spec.name          = "json_api_client-legacy"
  spec.version       = JsonApiClient::Legacy::VERSION
  spec.authors       = ["Jeff Ching"]
  spec.email         = ["ching.jeff@gmail.com"]

  spec.summary       = %q{Customizations for json_api_client 1.0.0 to handle 0.x servers}
  spec.description   = %q{Customizations for json_api_client 1.0.0 to handle 0.x servers}
  spec.homepage      = "https://github.com/chingor13/json_api_client-legacy"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "json_api_client", "~> 1.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "mocha"
end
