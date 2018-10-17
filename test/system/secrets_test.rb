require "application_system_test_case"

class SecretsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit new_secret_url

    fill_in "secret_raw_content", with: "My very secret password!"

    click_on "Keep it secret. Keep it safe."


    assert_text "-----BEGIN PGP MESSAGE-----"
    assert_text "-----END PGP MESSAGE-----"
  end
end
