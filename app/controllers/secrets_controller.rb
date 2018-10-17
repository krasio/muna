class SecretsController < ApplicationController
  def new
    @secret = Secret.new
  end

  def create
    secret = Secret.new(raw_content: params[:secret][:raw_content])
    @encrypted_secret = secret.encrypt_to(GPG_RECIPIENTS)
  end
end
