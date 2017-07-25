# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'partial_parameters/version'

Gem::Specification.new do |spec|
  spec.name          = 'partial_parameters'
  spec.version       = PartialParameters::VERSION
  spec.authors       = ['Julien Meichelbeck']
  spec.email         = ['julien.meichelbeck@gmail.com']

  spec.summary       = 'Validate the presence of parameters or deprecated parameters in your Rails partials.'
  spec.description   = 'Make your partials reusable and self-documented by validating the given parameters in development and test environments.'
  spec.homepage      = 'https://github.com/julien-meichelbeck/partial_parameters'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
