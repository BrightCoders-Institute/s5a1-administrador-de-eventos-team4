Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  post '/events/:id',  to: 'events#destroy'

  get '/events/index', to: 'events#index'

  get '/events/main', to: 'events#main'

  get '/events/new', to: 'events#new'

  get '/events/edit/:id', to: 'events#edit'

  patch '/events/:id', to: 'events#update'

  post '/events', to: 'events#create'

  devise_scope :user do
    get '/users/log_in' => 'devise/sessions#new'
  end

  devise_scope :user do
    get '/users/sig_in' => 'devise/sessions#new'
  end

  devise_scope :user do
    post '/users/sign_in' => 'devise/sessions#create'
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_scope :user do
    get '/users/password/new' => 'devise/passwords#new'
  end

  devise_scope :user do
    get '/users/password/edit' => 'devise/passwords#edit'
  end

  devise_scope :user do
    patch '/users/password' => 'devise/passwords#update'
  end

  devise_scope :user do
    post '/users/password' => 'devise/passwords#create'
  end

  devise_scope :user do
    put '/users/password' => 'devise/passwords#update'
  end

  devise_scope :user do
    get '/users/cancel' => 'devise/registrations#cancel'
  end

  devise_scope :user do
    get '/users/sign_up' => 'devise/registrations#new'
  end

  devise_scope :user do
    get '/users/edit' => 'devise/registrations#edit'
  end

  devise_scope :user do
    patch '/users' => 'devise/registrations#update'
  end

  devise_scope :user do
    put '/users' => 'devise/registrations#update'
  end

  # devise_scope :user do
  #   delete '/users' => 'devise/registrations#destroy'
  # end

  devise_scope :user do
    get '/users' => 'devise/registrations#create'
  end

  resources :events

  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'events#main'
end
