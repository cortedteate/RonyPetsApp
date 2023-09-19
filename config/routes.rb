Rails.application.routes.draw do
  root to: 'home#index'
  
  get 'plans/index'
  get 'portals/index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :categories
  resources :suppliers
  resources :products
  resources :inventory
  resources :sizes
  resources :quantities
  resources :breeds
  resources :plans

  resources :programs do
    collection do
      get 'new_program/:pet_id/:frecuency_id', action: :new_program, as: :new_program
      get 'user_programs/:user_id', action: :user_program, as: :user_program
    end
  end

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
