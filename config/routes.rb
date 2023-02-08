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
  resources :public_recipes, only: [:index]
  resources :general_shoping_list, only: [:index]
end

# root GET    /                                                                                                 food#index
# food_index GET    /food(.:format)                                                                                   food#index
#            POST   /food(.:format)                                                                                   food#create
#       food DELETE /food/:id(.:format)                                                                               food#destroy
#    recipes GET    /recipes(.:format)                                                                                recipes#index
#            POST   /recipes(.:format)                                                                                recipes#create
#     recipe GET    /recipes/:id(.:format)                                                                            recipes#show
#            DELETE /recipes/:id(.:format)                                                                            recipes#destroy
# public_recipes GET    /public_recipes(.:format)                                                                         public_recipes#index
# public_recipe GET    /public_recipes/:id(.:format)                                                                     public_recipes#show
# general_shoping_list_index GET    /general_shoping_list(.:format)                                                                   general_shoping_list#index