Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admins, ActiveAdmin::Devise.config

  root to: 'posts#index'

  ActiveAdmin.routes(self)

  get '/about-us', to: 'pages#about'
  get '/terms-of-service', to: 'pages#terms_of_service'
  get '/privacy-policy', to: 'pages#privacy_policy'
  get '/contact-us', to: 'pages#contact'
  get '/faq', to: 'pages#faq'
  get '/mailchimp/feed', to: 'mailchimp#feed'

  Sport.all.each do |sport|
    get "/#{sport.id}", to: 'games#index', sport_id: sport.id, as: sport.id.underscore.to_sym
  end

  resource :account, only: [:edit, :update]
  resources :account_requests, only: [:create]
  resources :assns, only: [:show] do
    resources :leagues, only: [:index]
    resources :teams, only: [:index]
  end
  resource :current_school, only: [:edit, :update]
  resources :game_stats, only: [:new]
  resources :games do
    collection do
      get :drafts
    end
  end
  resources :leagues, only: [:show] do
    resources :teams, only: [:index]
  end
  resources :players
  resources :posts
  resources :schools, only: [:index, :show, :edit, :update]
  resources :sports do
    resources :seasons, only: [:index]
  end
  resources :subscriptions, only: [:create]
  resources :teams do
    resources :opponents, only: [:index]
  end
end
