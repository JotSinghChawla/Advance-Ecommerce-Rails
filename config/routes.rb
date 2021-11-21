Rails.application.routes.draw do
  get 'carts/show'
  resources :items
  
  devise_for :users
  
  root 'home#index'

  resources :order_items

  resource :carts, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
