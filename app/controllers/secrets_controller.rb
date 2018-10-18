class SecretsController < ApplicationController
  def new
    @secret = Secret.new
  end

  def create
    @secret = Secret.new(secret_params)

    if @secret.valid?
      @encrypted_secret = @secret.encrypt_to(GPG_RECIPIENTS)
    else
      flash.alert = "Please provide some secrets, no need from all that secrecy if you don't have any!"
      render :new
    end
  end

  private

  def secret_params
    params.require(:secret).permit(:name, :raw)
  end
end
