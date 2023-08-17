Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  # Sidekiq Web UI, only for admins.
  # commentedout the line below because it was giving me an error
  # require "sidekiq/web"
  # # says, if user is an admin:
  # authenticate :user, ->(user) { user.admin? } do
  #   # user is then able to go to '/sidekiq' and see the sidekiq terminal
  #   mount Sidekiq::Web => '/sidekiq'
  # end

  resources :joys, only: [:new, :create, :index, :show]
  resources :recommendations, only: [:index, :new, :create, :show]
  resources :games, only: [:index, :show]

end
