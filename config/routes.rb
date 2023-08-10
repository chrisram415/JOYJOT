Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  resources :joys, only: [:new, :create, :index, :show]
  resources :recommendations, only: [:index, :new, :create, :show]
  resources :games, only: [:index, :show]

end
