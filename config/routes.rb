Rails.application.routes.draw do

  root to: 'sessions#welcome'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  resources :cafes do
    resources :reviews, shallow: true  #index, new, create actions
  end

  resources :categories
  resources :reviews, only: [:show, :edit, :update, :destroy]
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
