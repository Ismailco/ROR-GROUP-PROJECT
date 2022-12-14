Rails.application.routes.draw do
  resources :public_recipes, only: [:index]
  devise_for :users
  root to: "users#show"
  get 'general_shopping_list', to: 'shopping_list#index'
  resources :users
  resources :foods
  
  resources :recipes do
    resources :recipe_foods    
  end

  resources :recipes
  resources :recipe_foods
  resources :shopping_list

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
