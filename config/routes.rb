Rails.application.routes.draw do
  resources :flights, only: [:index, :destroy, :update, :create, :show]
  # resources :users, only: [:index, :create, :show]
  # get '/me', to: 'users#show'

  # resources :users, only: [:show] do
  #   # nested resource for flights
  #   resources :flights, only: [:show, :index, :create]
  # end



  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
