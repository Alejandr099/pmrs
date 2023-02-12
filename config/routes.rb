Rails.application.routes.draw do
  devise_for :accounts
  resources :properties
  resources :reservations
  #resources :properties, only: [:index, :show] do
  #  resources :reservations, only: [:new, :create]
  #end

  # admin routes
  get "/accounts" => 'admin#accounts', as: :accounts

  #get "/reservations_list" => 'reservations#show', as: :reservations_list

  get "/dashboard" => 'dashboard#index', as: :dashboard
  get "/profile/:id" => 'dashboard#profile', as: :profile
  post "/user/message" => "properties#email_user", as: :email_user

  #root to: 'public#main'
  root to: "public#main"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
