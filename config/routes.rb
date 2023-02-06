Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "food#index"

  resources :food, only: [:index, :create, :destroy]
  resources :recipes, only: [:index, :show, :create, :destroy]
  resources :public_recipes, only: [:index, :show]
  resources :general_shoping_list, only: [:index]
end
