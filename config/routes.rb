Rails.application.routes.draw do
  resources :ingredient_recipes
  resources :ingredients
  ### get request for omniauth / find or create user and initiate session
  get '/auth/:provider/callback', to: 'sessions#create'

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

  ### recipes / recipe/new nested into the current user (users/:user_id/recipes/new)
  #  new_user_recipe  GET   /users/:user_id/recipes/new   recipes#new
  resources :users, only: [] do 
    resources :recipes, only: [:new]
  end 

  ### recipes / only for index, create and show
  resources :recipes, only: [:index, :create, :show]
end
