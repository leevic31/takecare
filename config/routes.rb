Rails.application.routes.draw do
  get '/users/me', to: 'users#me'
  resources :users, only: [:create, :show]

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :organizations do
    resources :services
  end
  
  resources :bookings do
    resource :hold, only: [:create, :destroy]
  end
  
  resources :staff_members

  resources :availability_blocks, only: [:create]

  resources :booking_managements, only: [:create, :destroy]
end
