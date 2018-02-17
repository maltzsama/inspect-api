Rails.application.routes.draw do
  devise_for :users
  root to: 'occurrences#index'
  resources :occurrences
  resources :costumers
  resources :places
  resources :inspections
  resources :solutions
end
