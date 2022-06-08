Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#authenticate'
  post '/signup', to: 'users#create'
  # Defines the root path route ("/")
  # root "articles#index"
end
