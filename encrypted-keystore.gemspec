# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name          = 'encrypted-keystore'
  s.version       = '0.0.6'
  s.date          = '2019-06-27'
  s.summary       = 'Simple key encrypter/decrypter'
  s.description   = 'A simple encrypted key storage system.'
  s.homepage      = 'http://rubygems.org/gems/encrypted-keystore'
  s.license       = 'GPL-3.0'
  s.authors       = ['Julian Fiander']
  s.email         = 'julian@fiander.one'
  s.require_paths = %w[lib]
  s.files         = `git ls-files`.split("\n")

  s.add_runtime_dependency 'fileutils', '~> 1.2'
end
