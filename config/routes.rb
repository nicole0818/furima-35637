Rails.application.routes.draw do
  get 'products/index'
  devise_for :users
  root to: "products#index"

  resources :products, only: [:new,:create,:index,:show,:edit,:update,:destroy]
end
