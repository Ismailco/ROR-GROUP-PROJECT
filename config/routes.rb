Rails.application.routes.draw do
  resources :public_recipes, only: [:index]
  devise_for :users
  root to: "users#show"
  resources :users
  resources :foods
  
  resources :recipes do
    resources :recipe_foods    
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
