BoxScore::Application.routes.draw do
  devise_for :admins

  root to: 'games#index'

  Sport.all.each do |sport|
    match "/#{sport.id}", to: 'games#index', filter: { sport: sport.id }, as: sport.id.underscore.to_sym
  end

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
