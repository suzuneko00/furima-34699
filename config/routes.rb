Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users do
    resources :items, only: [:index, :new, :create]
  end
end
