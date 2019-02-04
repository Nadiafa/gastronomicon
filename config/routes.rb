Rails.application.routes.draw do
  resources :users, except: [:index, :update]
  root 'application#home'
end
