Rails.application.routes.draw do
  resources :users, param: :_username
  resources :puzzle_attempts, only: :create

  post '/users/authenticate', to: 'users#authenticate'
  get '/practice', to: 'users#practice'

  post '/pgn', to: 'puzzles#pgn'
end
