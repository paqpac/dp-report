Rails.application.routes.draw do
  devise_for :users
  root "dps#index"
  resources :dps, only: [:index, :new, :create]
end