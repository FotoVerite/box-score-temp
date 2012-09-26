BoxScore::Application.routes.draw do
  devise_for :admins

  root to: 'home#index'

  resources :schools, only: [:show, :edit, :update]
end
