Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }, skip: [:sessions]

  get 'holds/create'
  get 'holds/destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :organizations do
    resources :services do
      resources :service_sessions
    end
  end
  
  resources :bookings do
    resource :hold, only: [:create, :destroy]
  end
  
  resources :staff_members
end
