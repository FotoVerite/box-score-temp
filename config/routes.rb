BoxScore::Application.routes.draw do
  devise_for :admins

  root to: 'home#index'
  match 'games/boys-baseball', to: 'games#boys_baseball', as: 'boys_baseball'
  match 'games/boys-basketball', to: 'games#boys_basketball', as: 'boys_basketball'
  match 'games/girls-softball', to: 'games#girls_softball', as: 'girls_softball'
  match 'games/girls-basketball', to: 'games#girls_basketball', as: 'girls_basketball'

  resources :assns, only: [:show] do
    resources :leagues, only: [:index]
  end
  resources :leagues, only: [:show] do
    resources :teams, only: [:index]
  end
  resources :schools, only: [:index, :show, :edit, :update]
  resources :teams do
    resources :opponents, only: [:index]
  end
  resources :players
  resources :games
  resources :game_stats, only: [:new]
end
