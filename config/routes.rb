Rails.application.routes.draw do
  
  get 'portals/index'
  root to: 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :categories
  resources :suppliers
  resources :products
  resources :inventory
  resources :programs
  resources :sizes
  resources :quantities
  resources :breeds

  resources :clients do
    get '/new_pet', to: 'pets#new_from_client'
  end
  
  resources :pets do
    get '/phases', to: 'pets#phases'
    get '/kinds', to: 'pets#kinds'
    get '/product', to: 'pets#product'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
