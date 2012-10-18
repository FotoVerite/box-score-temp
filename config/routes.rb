BoxScore::Application.routes.draw do
  devise_for :admins

  root to: 'home#index'
  match 'games/baseball', to: 'games#baseball'

  resources :schools, only: [:index, :show, :edit, :update]
  resources :teams do
    resources :opponents, only: [:index]
  end
  resources :players
  resources :games
  resources :game_stats, only: [:new]
end
