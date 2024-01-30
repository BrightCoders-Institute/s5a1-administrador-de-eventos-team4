Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get '/events/index', to: 'events#index'

  get '/events/main', to: 'events#main'

  get '/events/new', to: 'events#new'

  # get '/events/show', to: 'events#show'

  get '/events/show/:id', to: 'events#show'
  # get '/events/:id/show', to: 'events#show'

  patch '/events/:id', to: 'events#update'

  post '/events', to: 'events#create'

  resources :events

  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'events#main'
end
