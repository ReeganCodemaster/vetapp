Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#authenticate'
  post '/signup', to: 'users#create'

  post '/pets/create', to: 'pets#create'
  post 'pets/:id/register', to:'pets#register'
  post 'pets/:id/appointment', to:'appointments#create'

  get 'vets/:id/registrations', to: 'users#registrations'
  
  post 'registrations/:id', to: 'registrations#accept_registration'

  get 'users/:id', to: 'users#show'

  # Defines the root path route ("/")
  # root "articles#index"
end
