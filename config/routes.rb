Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#authenticate'
  post '/signup', to: 'users#create'

  post '/pets/create', to: 'pets#create'
  post 'pets/:id/register', to:'pets#register'
  post 'pets/:id/appointment', to:'appointments#create'
  
  resources :registrations , only: :update

  get 'user', to: 'users#show'

  get 'vets', to: 'users#vets'

  # Defines the root path route ("/")
  # root "articles#index"
end
