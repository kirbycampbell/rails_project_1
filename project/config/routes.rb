Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get '/welcome' => 'users#welcome'
  get '/start' => 'application#start'
  root 'users#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :topics do
    resources :photos
    resources :statements
  end
  resources :photos
  resources :statements

end
