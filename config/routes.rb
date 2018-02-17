Rails.application.routes.draw do
  resources :occurrences
  resources :costumers
  resources :places
  resources :inspections
  resources :solutions
end
