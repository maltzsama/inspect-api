Rails.application.routes.draw do
  resources :occurrences
  resources :costumers
  resources :places
  resources :inspections
  resources :solutions
  
  namespace :user do
    post 'auth', to: 'authentication#authenticate'
    post 'sign_up', to: 'register#sign_up'
    post 'forgot_passwd', to: 'password#forgot_passwd'
  end
end
