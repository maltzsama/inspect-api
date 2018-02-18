Rails.application.routes.draw do

  devise_for :users, defaults: { format: :json }, 
    controllers: { sessions: 'users/sessions',
                registrations: 'users/registrations' }
  root to: 'occurrences#index', defaults: { format: :json }
  resources :occurrences, defaults: { format: :json }
  resources :costumers, defaults: { format: :json }
  resources :places, defaults: { format: :json }
  resources :inspections, defaults: { format: :json }
  resources :solutions, defaults: { format: :json }

end
