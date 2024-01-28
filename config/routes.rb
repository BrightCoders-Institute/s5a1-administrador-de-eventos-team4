Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get '/index', to: 'events#index'
  # post 'list_views', to: 'events#create'
  get '/main', to: 'events#main'

  get '/events', to: 'events#create'
  # # get '/create', to: 'events#create'
  post '/events', to: 'events#create'

  # resources :events

  get 'up' => 'rails/health#show', as: :rails_health_check
  # Defines the root path route ("/")
  root 'events#main'
end
