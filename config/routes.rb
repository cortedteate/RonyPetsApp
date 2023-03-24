Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: 'home#index'
  resources :categories
  resources :clients
  resources :suppliers
  resources :products
  resources :pets



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
