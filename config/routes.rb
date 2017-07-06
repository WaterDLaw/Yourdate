Rails.application.routes.draw do

  devise_for :users


  resources :users, only: [:index]
  resources :profiles

  resources :personal_messages, only: [:new, :create]
  resources :conversations, only: [:index, :show]

  root 'conversations#index'

  mount ActionCable.server => '/cable'

end
