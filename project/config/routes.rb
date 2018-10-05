Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :topics
  resources :users
  get '/welcome' => 'users#welcome'
  get '/start' => 'application#start'
  root 'users#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :topics, only: [:new, :create, :edit, :update, :destroy]
  resources :photos, only: [:new, :create, :edit, :update, :destroy]
  resources :statements, only: [:new, :create, :edit, :update, :destroy]
end
