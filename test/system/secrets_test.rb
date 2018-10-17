require "application_system_test_case"

class SecretsTest < ApplicationSystemTestCase
  test "Encrypt some secret text" do
    visit new_secret_url

    fill_in "secret_raw_content", with: "My very secret password!"

    click_on "Keep it secret. Keep it safe."

    assert_text "-----BEGIN PGP MESSAGE-----"
    assert_text "-----END PGP MESSAGE-----"
  end
  
  test "Try to encrypt blank secret" do
    visit new_secret_url

    click_on "Keep it secret. Keep it safe."

    assert_text "Please provide some secrets to be encrypted!"
  end
end
