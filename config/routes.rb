Rails.application.routes.draw do
  
  # generates all the RESTful routes for users
  resources :users

  # could have done this instead to give exactly what you asked for
  # get "/users", to: 'users#index'
  # get "/users/:id", to: 'users#show'

end
