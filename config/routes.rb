Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => 'sidekiq'
  get 'sessions/new'

  concern :likeable do
    resource :like, only: [:create, :destroy]
  end

  resources :articles, concerns: [:likeable] do
  	resources :comments
	end
  resources :users
  root "articles#index"

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
