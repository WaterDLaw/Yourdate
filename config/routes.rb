Rails.application.routes.draw do

  root 'statics#home'

  resources :photographs
  post '/profile_picture', to: 'photographs#upload_profile_pic'
  post '/change_profile_pic', to: 'photographs#change_profile_pic'

  resources :galleries
  get '/mygallery', to: 'galleries#mygallery'
  devise_for :users


  resources :users, only: [:index]
  resources :profiles do
    member do
      get 'like'
      get 'unlike'
    end
  end

  get '/myprofile', to: 'profiles#myprofile'
  get '/i_like', to: 'profiles#i_like'
  get '/likes_me', to: 'profiles#likes_me'
  get '/mutual_likes', to: 'profiles#mutual_likes'

  resources :personal_messages, only: [:new, :create]
  resources :conversations, only: [:index, :show]



  mount ActionCable.server => '/cable'

end
