Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # root      GET    /          application#home
  root 'application#home'
  
  # signup    GET    /signup    users#new
  get '/signup', to: 'users#new'
  resources :users, except: [:index, :new, :update]
  

  # signup    GET    /signup          users#new
  # users     POST   /users           users#create
  # new_user  GET    /users/new       users#new
  # edit_user GET    /users/:id/edit  users#edit
  # user      GET    /users/:id       users#show
  #           DELETE /users/:id       users#destroy

end
