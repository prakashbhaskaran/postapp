Rails.application.routes.draw do
  get 'mypost', to: 'profile#index'
  resources :posts, only: [:show, :edit, :new, :create, :update, :destroy]
  
  #signup and signin
  get 'signup', to:'signup#new'
  post 'signup', to:'signup#create'
  post 'signin', to: 'signin#create'
  get 'signin', to: 'signin#index'

  #logout
  delete 'logout', to: 'signin#destroy'

  #home
  root "posts#index"
end
