# -*- encoding: utf-8 -*-
require File.expand_path('../lib/magti/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dimitri Kurashvili"]
  gem.email         = ["dimakura@gmail.com"]
  gem.description   = %q{Magti SMS gateway}
  gem.summary       = %q{Gem for sending SMS using MagtiGSM.ge gateway}
  gem.homepage      = "http://github.com/dimakura/magti"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "magti"
  gem.require_paths = ["lib"]
  gem.version       = Magti::VERSION
  gem.license = 'MIT'

  gem.add_development_dependency 'rspec', '~> 2'
  gem.add_runtime_dependency 'httparty', '~> 0.8'
end
