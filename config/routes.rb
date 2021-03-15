Rails.application.routes.draw do

  root to: 'sessions#welcome'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :categories
  resources :reviews
  resources :users
  resources :cafes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
