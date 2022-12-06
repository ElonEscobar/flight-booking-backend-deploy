Rails.application.routes.draw do
  resources :flights, only: [:index, :destroy, :update, :create]
  resources :users, only: [:index, :create, :show]

  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
