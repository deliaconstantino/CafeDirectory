Rails.application.routes.draw do

  root to: 'sessions#welcome'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  resources :reviews #question: reviews nested new path fails when I don't have it listed here as well as in the nested spot below. Why?
  # resources :categories
  resources :cafes do
    resources :reviews, shallow: true  #index, new, create actions
    resources :categories, shallow: true do
      get 'accept', :on => :new, to: 'cafes#accept'
    end
  end

  resources :users, only: [:new, :show, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
