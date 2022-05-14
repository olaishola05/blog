Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  root  'users#index'

  post "/api/register", to: 'authentications#register'
  post '/api/login', to: 'authentications#login'
  get '/api/users/:user_id/posts', to: 'posts#posts'
  get '/api/posts/:id/comments', to: 'comments#comments'
  post '/api/comments', to: 'comments#add_comment'

end
