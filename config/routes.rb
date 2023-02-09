Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foods#index"

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :create, :destroy]
  resources :public_recipes, only: [:index]
  resources :general_shoping_lists, only: [:index]
end
