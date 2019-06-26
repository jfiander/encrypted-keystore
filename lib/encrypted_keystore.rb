# frozen_string_literal: true

class EncryptedKeystore
  require 'openssl'
  require 'base64'

  attr_accessor :file, :out, :key, :iv

  def self.encrypt(file, out)
    enc = new(file: file, out: out)
    enc.encrypt

    { key: enc.key, iv: enc.iv }
  end

  def self.decrypt(file, out, key, iv)
    enc = new(file: file, out: out, key: key, iv: iv)
    enc.decrypt
  end

  def initialize(file: nil, out: nil, key: nil, iv: nil)
    @file = file
    @out = out
    @key = key
    @iv = iv
  end

  def decrypt
    validate

    write(dec_cipher)
  end

  def encrypt
    validate(enc: true)

    write(enc_cipher)
  end

private

  def dec_cipher
    cipher = OpenSSL::Cipher.new('aes-256-cbc')
    cipher.decrypt
    cipher.key = Base64.decode64(@key)
    cipher.iv = Base64.decode64(@iv)
    cipher
  end

  def enc_cipher
    cipher = OpenSSL::Cipher.new('aes-256-cbc')
    cipher.encrypt
    @key = Base64.encode64(cipher.random_key)
    @iv = Base64.encode64(cipher.random_iv)
    cipher
  end

  def write(cipher)
    validate

    buffer = +''
    File.open(@out, 'wb') do |outfile|
      File.open(@file, 'rb') do |infile|
        outfile << cipher.update(buffer) while infile.read(4096, buffer)
        outfile << cipher.final
      end
    end

    @out
  end

  def validate(enc: false)
    return true if !@file.nil? && !@out.nil? && (!enc || (!@key.nil? && !@iv.nil?))

    raise ArgumentError, 'Required arguments have not been provided.'
  end
end
