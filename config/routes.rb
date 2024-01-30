Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'events/index', to: 'events#index'

  get 'events/main', to: 'events#main'

  get '/events/new', to: 'events#new'

  post '/events', to: 'events#create'

  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'events#main'
end
