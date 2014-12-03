# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hid_core/version'

Gem::Specification.new do |spec|
  spec.name          = 'hid_core'
  spec.version       = HidCore::VERSION
  spec.authors       = ['Benjamin Cavileer']
  spec.email         = ['bcavileer@holmanauto.com']
  spec.summary       = %q{Identity Mapping}
  spec.description   = %q{Maps string to other strings?}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'activerecord'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'database_cleaner'
end
