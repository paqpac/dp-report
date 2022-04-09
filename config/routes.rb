Rails.application.routes.draw do
  devise_for :users
  root "dps#index"
  resources :dps do
    collection do
      get 'search'
    end
  end
end