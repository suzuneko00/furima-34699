Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  devise_for :users
  root to: "items#index"
  resources :users do
    resources :items, only: [:index, :new, :create]
  end
  resources :categories
end
