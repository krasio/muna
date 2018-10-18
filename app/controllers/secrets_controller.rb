class SecretsController < ApplicationController
  def new
    @secret = Secret.new
  end

  def create
    secret = Secret.new(raw_content: params[:secret][:raw_content])

    if secret.valid?
      @encrypted_secret = secret.encrypt_to(GPG_RECIPIENTS)
    else
      flash.alert = "Please provide some secrets, no need from all that secrecy if you don't have any!"
      redirect_to new_secret_path
    end
  end
end
