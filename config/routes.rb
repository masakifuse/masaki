Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  # get 'home/index'消したいらないみたい
  devise_for :users
  root to: "home#index"
  resources :users
end
