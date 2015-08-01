Rails.application.routes.draw do
  root to: 'visitors#index'

  resources :scores

  resources :games do
    resources :game_levels
  end

  devise_for :users
  resources :users do
    resources :scores
  end
end
