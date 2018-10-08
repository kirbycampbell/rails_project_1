Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get '/welcome' => 'users#welcome'
  get '/start' => 'application#start'
  root 'users#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get 'auth/:provider/callback', to: 'sessions#oauth'
  get 'auth/failure', to: redirect('/')
  post '/topics/:id' => 'topics#show'

  resources :topics do
    resources :photos
    resources :statements
  end
  resources :photos
  resources :statements

  get '/topic_all' => 'topics#show_all'
  post '/topic_all' => 'topics#show_all'

end
