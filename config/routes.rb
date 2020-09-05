Rails.application.routes.draw do
  
  resources :items, only: [:index, :show, :update, :create]
  resources :users, only: [:create]

  post '/login', to: 'users#login'
  get '/persist', to: 'users#persist'
  get '/user-items', to: 'users#user_items'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
