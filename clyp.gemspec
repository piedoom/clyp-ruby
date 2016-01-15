# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clyp/version'

Gem::Specification.new do |spec|
  spec.name          = "clyp"
  spec.version       = Clyp::VERSION
  spec.authors       = ["Alexander Lozada"]
  spec.email         = ["alexanderpaullozada@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  end

  spec.summary       = %q{An API wrapper for the audio sharing website, clyp.it}
  spec.homepage      = "https://github.com/piedoom/clyp-ruby"
  spec.license       = "BSD-3-Clause"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_dependency "faraday"
  spec.add_dependency "rest-client"
  spec.add_dependency "json"
end
