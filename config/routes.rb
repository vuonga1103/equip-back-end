Rails.application.routes.draw do
  
  resources :items, only: [:index, :show, :update, :create]
  resources :users, only: [:create, :update]

  post '/login', to: 'users#login'
  get '/persist', to: 'users#persist'
  get '/user-items', to: 'users#user_items'
  post '/validate-current-password', to: 'users#validate_current_password'
  post '/change-password', to: 'users#change_password'

  # get 'items/page/:page', to: 'items#specific_amounts'

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
