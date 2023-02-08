Rails.application.routes.draw do
  # get 'foods/index'
  # get 'foods/new'
  # get 'foods/create'
  # get 'foods/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foods#index"

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :create, :destroy]
  resources :public_recipes, only: [:index, :show]
  resources :general_shoping_list, only: [:index]
end
