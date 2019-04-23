Rails.application.routes.draw do

  get 'homes/about'

  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  # get 'password_resets/new'

  # get 'password_resets/edit'

  require 'sidekiq/web'
  if Rails.env.production?
    mount Sidekiq::Web => 'sidekiq'
  end
  mount ApiRoot => '/api'
  mount GrapeSwaggerRails::Engine, at: "/doc"
  post '/get_sms_code', to: "users#get_sms_code"
  post '/password_resets_code', to: "password_resets#password_resets_code"
  get '/check_name', to: 'users#check_name'
  get '/check_email', to: 'users#check_email'
  get '/check_phone', to: 'users#check_phone'

  concern :likeable do
    resource :like, only: [:create, :destroy]
  end
	
  concern :commentable do
    resources :comments, concerns: [:likeable]
  end

  resources :articles, concerns: [:likeable, :commentable]
  resources :comments, concerns: [:likeable]
  resources :users do
    resources :articles do
    collection do
      get :release
    end
    end
    member do
      get :person
      get :profile
    end
  end

  resources :sessions
  resources :notifications, only: [:index, :destroy] do
    collection do
      post :mark
      delete :clear
    end
  end
  resource :password_resets
   
  root "articles#index"
  get "welcome", to: "welcomes#index"
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  namespace :admin do
    root "welcomes#index"
    resources :welcomes
    resources :users do
      member do
       get :rencent_new_user
      end
    end
    resources :articles do
      member do
        patch :complete
        post :deny
    end
  end
    resources :comments
    get "signup", to: "users#new", as: "signup"
    get "login", to: "sessions#new", as: "login"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
  end
end
