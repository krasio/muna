Rails.application.routes.draw do
  resources :secrets, only: [:new, :create, :show]

  root "secrets#new"
end
