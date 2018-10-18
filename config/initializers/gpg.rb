recipients = if Rails.env.production?
               ENV.fetch("MUNA_GPG_RECIPIENTS")
             else
               ENV.fetch("MUNA_GPG_RECIPIENTS", "muna.test@fluxfederation.com")
             end
GPG_RECIPIENTS = recipients.split(",")

if public_keys = ENV.fetch("MUNA_GPG_PUBLIC_KEYS", false)
  GPGME::Key.import(public_keys)
end

default_public_keys_path = File.join(Rails.root, "test", "support") unless Rails.env.production?
if public_keys_path = ENV.fetch("MUNA_GPG_PUBLIC_KEYS_PATH", default_public_keys_path)
  Dir.glob(File.join(public_keys_path, "*.pub")).each {|public_key| GPGME::Key.import(public_key)}
end
