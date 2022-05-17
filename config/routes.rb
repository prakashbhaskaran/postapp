Rails.application.routes.draw do
  post 'postcreate', to: "posts#create"
  get '/posts/:id', to: 'posts#show'
  delete 'deletepost', to: 'posts#destroy'
  
  #signup and signin
  get 'signup', to:'signup#new'
  post 'signup', to:'signup#create'
  post 'signin', to: 'signin#create'
  get 'signin', to: 'signin#index'

  #logout
  delete 'logout', to: 'signin#destroy'

  #home
  root "home#index"
end
