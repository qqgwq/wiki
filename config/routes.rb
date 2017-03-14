Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  require 'sidekiq/web'
  mount Sidekiq::Web => 'sidekiq'
  get 'sessions/new'

  concern :likeable do
    resource :like, only: [:create, :destroy]
  end
	
  concern :commentable do
    resources :comments, concerns: [:likeable]
  end

  resources :articles, concerns: [:likeable, :commentable]

  resources :users do
    member do
      get :person
    end
  end
  #resources :password_resets, only: [:new, :create, :edit, :update]
   
  root "articles#index"

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
