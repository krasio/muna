class Secret
  include ActiveModel::Model

  attr_accessor :raw_content, :encrypted_content

  def encrypt_to(recipients)
    gpg = GPGME::Crypto.new(:armor => true)
    gpg.encrypt(raw_content, recipients: recipients, always_trust: true).read
  end
end
