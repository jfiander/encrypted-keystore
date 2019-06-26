# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name          = 'encrypted-keystore'
  s.version       = '0.0.1'
  s.date          = '2019-06-26'
  s.summary       = 'Simple key encrypter/decrypter'
  s.description   = 'A simple encrypted key storage system.'
  s.homepage      = 'http://rubygems.org/gems/encrypted-keystore'
  s.license       = 'GPL-3.0'
  s.authors       = ['Julian Fiander']
  s.email         = 'julian@fiander.one'
  s.require_paths = %w[lib]
  s.files         = `git ls-files`.split("\n")
end
