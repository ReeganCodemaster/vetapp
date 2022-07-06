Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'users#authenticate'
  post '/signup', to: 'users#create'

  post 'pets/:id/appointment', to:'appointments#create'
  
  resources :registrations , only: :update
  
  resources :pets, only: :create do
    resources :registrations, only: :create
  end

  get 'user', to: 'users#show'

  get 'vets', to: 'users#vets'

  get 'vets/emails', to: 'users#pluck_vets'

  # Defines the root path route ("/")
  # root "articles#index"
end
