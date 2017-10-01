# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "anomalous/version"

Gem::Specification.new do |spec|
  spec.name          = "anomalous"
  spec.version       = Anomalous::VERSION
  spec.authors       = ["Alex Miller"]
  spec.email         = ["apmiller108@yahoo.com"]

  spec.summary       = %q{Anomaly detection}
  spec.description   = %q{Detect anomalous examples from the density function a dataset.}
  spec.homepage      = "https://github.com/apmiller108/anomalous"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nmatrix", "0.2.3"
  spec.add_dependency "nyaplot", "~> 0.1.6"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
