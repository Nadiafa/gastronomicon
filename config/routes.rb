Rails.application.routes.draw do
  ### redirect '/' to a home/welcome page
  # root      GET    /          application#home
  root 'application#home'
  
  ### signup / create a user
  # signup    GET    /signup    users#new
  get '/signup', to: 'users#new'
  resources :users, except: [:index, :new, :update]
  
  ### login & logout / create & destroy a session
  # login     GET    /login    sessions#new
  get '/login', to: 'sessions#new'
  #           POST   /login    sessions#create
  post '/login', to: 'sessions#create'
  # logout    GET    /logout   sessions#destroy
  get '/logout', to: 'sessions#destroy'
end
