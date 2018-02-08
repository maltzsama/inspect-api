Rails.application.routes.draw do
  resources :occurrences
  resources :posts
  resources :costumers
  resources :places
  resources :inspections
  resources :solutions
end
