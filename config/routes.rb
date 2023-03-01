Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # resources :eventspaces
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # For user action "As a user I can book an event space" 👇

  resources :eventspaces do
    resources :bookings, only: [:create] # index
  end

    # displaying a form to create a new booking (GET /bookings/new),4
    # actually creating a new booking based on the form data (POST /bookings).

  # resources allows us to write the below in an easier manner:
  # get 'eventspaces/:eventspaces_id/bookings/new', to: 'bookings#new'
  # post 'eventspaces/:eventspaces_id/bookings', to: 'bookings#create'

  get '/my_bookings', to: 'bookings#select'
  get '/my_eventspaces', to: 'eventspaces#select'

end
