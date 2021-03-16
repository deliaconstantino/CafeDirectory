Rails.application.routes.draw do

  root to: 'sessions#welcome'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :reviews #question: reviews nested new path fails when I don't have it listed here as well as in the nested spot below. Why?
  resources :cafes do
    resources :reviews, shallow: true  #index, new, create actions
  end

  resources :categories

  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
