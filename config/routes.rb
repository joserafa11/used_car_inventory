Rails.application.routes.draw do
  get '/errors', to: 'errors#index'
  devise_for :users
  root 'dealerships#index'
  
  resources :dealerships
  get '/dealerships/:id/cars', to: 'dealerships#cars'

  resources :cars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
