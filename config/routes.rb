Rails.application.routes.draw do

  get 'users/index'

  get 'users/new', to: 'users#new'
  

  root  'users#index'
end
