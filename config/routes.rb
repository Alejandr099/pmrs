Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/show'
  get 'reservations/new'
  devise_for :accounts
  resources :properties
  resources :reservations
  #resources :properties, only: [:index, :show] do
  #  resources :reservations, only: [:new, :create]
  #end

  # admin routes
  get "/accounts" => 'admin#accounts', as: :accounts

  get "/dashboard" => 'dashboard#index', as: :dashboard
  get "/profile/:id" => 'dashboard#profile', as: :profile
  post "/agent/message" => "properties#email_agent", as: :email_agent

  root to: 'public#main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
