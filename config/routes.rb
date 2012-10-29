BoxScore::Application.routes.draw do
  devise_for :admins

  root to: 'games#index'
  match '/about-us', to: 'pages#about'
  match '/terms-of-service', to: 'pages#terms_of_service'
  match '/privacy-policy', to: 'pages#privacy_policy'

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
