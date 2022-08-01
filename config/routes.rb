Rails.application.routes.draw do
  get 'organization', to: 'organization#index'
  resources :initiatives
  resources :key_results
  resources :objectives
  resources :owners
  devise_for :users
  #get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
