class Secret
  include ActiveModel::Model

  attr_accessor :raw, :name

  validates :raw,
    presence: true

  def encrypt_to(recipients)
    gpg = GPGME::Crypto.new(:armor => true)
    gpg.encrypt(raw, recipients: recipients, always_trust: true).read
  end
end
