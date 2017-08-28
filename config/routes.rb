Rails.application.routes.draw do

  resources :photographs
  post '/profile_picture', to: 'photographs#upload_profile_pic'
  post '/change_profile_pic', to: 'photographs#change_profile_pic'

  resources :galleries
  get '/mygallery', to: 'galleries#mygallery'
  devise_for :users


  resources :users, only: [:index]
  resources :profiles
  get '/myprofile', to: 'profiles#myprofile'


  resources :personal_messages, only: [:new, :create]
  resources :conversations, only: [:index, :show]

  root 'conversations#index'

  mount ActionCable.server => '/cable'

end
