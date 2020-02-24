Rails.application.routes.draw do
  resources :users, param: :_username
  resources :user_puzzles, only: :create

  post '/users/authenticate', to: 'users#authenticate'
  get '/practice', to: 'users#practice'

  post '/pgn', to: 'puzzles#pgn'
end
