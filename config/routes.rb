Rails.application.routes.draw do
  get 'products/index'
  devise_for :users
  root to: "products#index"

  resources :products, only: [:new,:create,:index,:show,:edit,:update,:destroy]
  resources :products do
    resources :purchase_records, only:[:index, :create]
  end
end
