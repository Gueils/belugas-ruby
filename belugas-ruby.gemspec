# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'belugas/ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "belugas-ruby"
  spec.version       = Belugas::Ruby::VERSION
  spec.authors       = ["Roberto Quintanilla", "Abraham Kuri", "Cejas"]
  spec.email         = ["weare@icalialabs.com"]

  spec.summary       = %q{A Ruby CLI for ruby feature detection}
  spec.description   = %q{A Ruby CLI for ruby feature detection using awesome Belugas}
  spec.homepage      = "https://github.com/icalialabs/belugas-ruby"
  spec.license       = "MIT"

  #spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    #f.match(%r{^(test|spec|features)/})
  #end
  spec.bindir        = "bin"
  spec.executables   = ["belugas-ruby"]
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
