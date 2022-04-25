Rails.application.routes.draw do

  get '/users/index'

  get '/users/:id', to: 'users#show'
  

  root  'users#index'
end
