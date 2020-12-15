Rails.application.routes.draw do
  
  resources :items, only: [:index, :show, :update, :create, :destroy]
  resources :users, only: [:create, :update]

  root to: 'users#welcome'
  post '/login', to: 'users#login'
  get '/persist', to: 'users#persist'
  get '/user-items', to: 'users#user_items'
  post '/validate-current-password', to: 'users#validate_current_password'
  post '/change-password', to: 'users#change_password'
  get '/user-item/:id', to: 'users#user_item'
  post 'edit-item/:id', to: 'items#edit_item'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
