Rails.application.routes.draw do
  devise_for :users
  resources :occurrences
  resources :costumers
  resources :places
  resources :inspections
  resources :solutions
end
