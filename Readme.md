# Encrypted Keystore

[![Gem Version](https://img.shields.io/gem/v/encrypted-keystore.svg)](https://rubygems.org/gems/encrypted-keystore)

A simple encrypted key storage system.

## Installation

Add this to your Gemfile:

```ruby
gem 'encrypted-keystore'
```

or install directly:

```bash
gem install encrypted-keystore
```

## Inclusion

In `config/application.rb`, include the following:

```ruby
require 'encrypted_keystore'
```

## Usage

### Direct Construction

Encrypt:

```ruby
ek = EncryptedKeystore.new(
  file: 'path/to/key.pem',
  out: 'path/to/encrypted.pem.enc'
)

ek.encrypt
key = ek.key
iv = ek.iv
```

Decrypt:

```ruby
ek = EncryptedKeystore.new(
  file: 'path/to/encrypted.pem.enc',
  out: 'path/to/key.pem',
  key: key,
  iv: iv
)

ek.decrypt
```

### Class Methods

```ruby
key_hash = EncryptedKeystore.encrypt(
  file: 'path/to/key.pem',
  out: 'path/to/encrypted.pem.enc'
)

EncryptedKeystore.decrypt(
  file: 'path/to/encrypted.pem.enc',
  out: 'path/to/key.pem',
  key: key,
  iv: iv
)
```
