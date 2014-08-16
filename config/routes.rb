Rails.application.routes.draw do
  resources :scores

  resources :games do
    resources :game_levels
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
