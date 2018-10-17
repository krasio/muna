GPG_RECIPIENTS = Dir.glob(File.join(Rails.root, "config/gpg", "*.pub")).map do |public_key|
  GPGME::Key.import(public_key)
  File.basename(public_key, ".pub").tap {|r| Rails.logger.info "Imported public key for #{r}."}
end
