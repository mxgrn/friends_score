Rails.application.routes.draw do
  resources :scores

  resources :game_levels

  resources :games

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
