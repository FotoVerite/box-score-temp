BoxScore::Application.routes.draw do
  devise_for :admins

  root to: 'games#index'
  match '/about-us', to: 'pages#about'
  match '/terms-of-service', to: 'pages#terms_of_service'
  match '/privacy-policy', to: 'pages#privacy_policy'
  match '/contact-us', to: 'pages#contact'

  Sport.all.each do |sport|
    match "/#{sport.id}", to: 'games#index', sport_id: sport.id, as: sport.id.underscore.to_sym
  end

  resources :teams do
    resources :opponents, only: [:index]
  end
  resources :assns, only: [:show] do
    resources :leagues, only: [:index]
  end
  resources :leagues, only: [:show] do
    resources :teams, only: [:index]
  end
  resources :schools, only: [:index, :show, :edit, :update]
  resources :players
  resources :games
  resources :game_stats, only: [:new]
  resources :account_requests
end
