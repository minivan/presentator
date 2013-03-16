# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'presentator/version'

Gem::Specification.new do |gem|
  gem.name          = "presentator"
  gem.version       = Presentator::VERSION
  gem.authors       = ["Ivan Zarea"]
  gem.email         = ["zarea.ion@gmail.com"]
  gem.description   = %q{Create presentations in your terminal}
  gem.summary       = %q{Easy to use library for creating simple presentations for the terminal.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "docile"
end
