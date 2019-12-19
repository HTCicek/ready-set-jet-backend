Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[create show update destroy]
  resources :flights, only: %i[create show update destroy]

  get '/locations', to: 'locations#index'

  post '/login', to: 'auth#create'
  get '/auto_login', to: 'auth#auto_login'
end
