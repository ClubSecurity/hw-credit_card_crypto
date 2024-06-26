# frozen_string_literal: true

require 'rbnacl'
require 'base64'
# Encrypt and decrypt document using modern symmetric cipher
module ModernSymmetricCipher
  def self.generate_new_key
    # TODO: Return a new key as a Base64 string
    key = RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes)
    Base64.strict_encode64(key)
  end

  def self.encrypt(document, key)
    # TODO: Return an encrypted string
    #       Use base64 for ciphertext so that it is sendable as text
    simple_box = RbNaCl::SimpleBox.from_secret_key(Base64.strict_decode64(key))
    encrypted_cc = simple_box.encrypt(document)
    Base64.strict_encode64(encrypted_cc)
  end

  def self.decrypt(encrypted_cc, key)
    encrypted_cc = Base64.strict_decode64(encrypted_cc)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key
    simple_box = RbNaCl::SimpleBox.from_secret_key(Base64.strict_decode64(key))
    simple_box.decrypt(encrypted_cc)
  end
end
