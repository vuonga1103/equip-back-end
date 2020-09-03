Rails.application.routes.draw do
  post '/login', to: 'users#login'
  get '/persist', to: 'users#persist'
  resources :items, only: [:index, :show]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
