BoxScore::Application.routes.draw do
  devise_for :admins

  root to: 'home#index'

  resources :schools, only: [:index, :show, :edit, :update]
  resources :teams
  resources :players
end
