Rails.application.routes.draw do
  get '/users/me', to: 'users#me'
  resources :users, only: [:create, :show]

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

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

  resources :bookings_by_day_and_hour, only: [:index] do
    collection do
      get ':date/:hour', to: 'bookings_by_day_and_hour#index', as: :by_day_and_hour
    end
  end
end
