Rails.application.routes.draw do
  get 'sessions/new'

  resources :articles do
  	resources :comments
	end
  resources :users
  root "articles#index"

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
