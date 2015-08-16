# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest/blink1_reporter/version'

Gem::Specification.new do |spec|
  spec.name          = "minitest-blink1_reporter"
  spec.version       = Minitest::Blink1Reporter::VERSION
  spec.authors       = ["Simon George"]
  spec.email         = ["simon@sfcgeorge.co.uk"]

  spec.summary       = %q{Display minitest results with a Blink(1)}
  spec.description   = %q{Lights up your Blink(1) red / orange / green when tests pass / skip / fail, and purple while running. It makes testing fun!}
  spec.homepage      = "https://github.com/sfcgeorge/minitest-blink1_reporter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "rb-blink1"
end
