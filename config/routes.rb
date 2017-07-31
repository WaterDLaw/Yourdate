Rails.application.routes.draw do

  resources :photographs
  resources :galleries
  get '/mygallery', to: 'galleries#mygallery'
  devise_for :users


  resources :users, only: [:index]
  resources :profiles
  get '/myprofile', to: 'profiles#myprofile'
  post '/profile_picture', to: 'profiles#update_profile_image'

  resources :personal_messages, only: [:new, :create]
  resources :conversations, only: [:index, :show]

  root 'conversations#index'

  mount ActionCable.server => '/cable'

end
