public_keys_path = ENV.fetch("GPG_PUBLIC_KEYS", File.join(Rails.root, "config/gpg", "*.pub"))
GPG_RECIPIENTS = Dir.glob(public_keys_path).map do |public_key|
  GPGME::Key.import(public_key)
  File.basename(public_key, ".pub").tap {|r| Rails.logger.info "Imported public key for #{r}."}
end
