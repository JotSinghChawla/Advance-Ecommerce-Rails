Rails.application.routes.draw do
  get 'products' => 'products#index'
  # get 'products', to: 'products#index'
  get 'products/show'

  # get 'carts/show'

  resources :items
  
  devise_for :users
  
  root 'home#index'

  resources :order_items

  resource :carts, only: [:show, :create]
  get 'carts/success'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
