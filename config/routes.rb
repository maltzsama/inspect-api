Rails.application.routes.draw do
  resources :occurrences
  resources :posts
  resources :costumers
  resources :places
  resources :inspections
  resources :solutions
  
  namespace :user do
    post 'auth', to: 'authentication#authenticate'
    post 'sign_up', to: 'register#sign_up'
  end
end
