BoxScore::Application.routes.draw do
  devise_for :admins

  root to: 'home#index'
end
