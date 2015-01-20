# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "who-broke-my-app"
  spec.version       = "0.0.2"
  spec.authors       = ["Jessie Keck"]
  spec.email         = ["jkeck@stanford.edu"]
  spec.summary       = %q{Simple ruby script to take a Gemfile.lock file and determine which dependencies have been recently updated.}
  spec.homepage      = ""
  
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency 'faraday'
  
  spec.add_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
