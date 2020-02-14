Rails.application.routes.draw do
  resources :users, param: :_username
  post '/users/authenticate', to: 'users#authenticate'
  get '/practice', to: 'users#practice'

  resources :puzzles, only: :create
end
