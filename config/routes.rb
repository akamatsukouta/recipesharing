Rails.application.routes.draw do
  devise_for :users
  root to: 'cookings#index'

  resources :users, only: [:show]
  resources :cookings, only: [:new, :create, :show, :edit, :update, :destroy]
end
