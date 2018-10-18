GPG_RECIPIENTS = ENV.fetch("MUNA_GPG_RECIPIENTS").split(",")

if public_keys = ENV.fetch("MUNA_GPG_PUBLIC_KEYS", false)
  GPGME::Key.import(public_keys)
end

if public_keys_path = ENV.fetch("MUNA_GPG_PUBLIC_KEYS_PATH", false)
  Dir.glob(File.join(public_keys_path, "*.pub")).each {|public_key| GPGME::Key.import(public_key)}
end
