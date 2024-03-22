Rails.application.routes.draw do
  get 'errors/not_found'

  get "up" => "rails/health#show", as: :rails_health_check

  root 'home#index'
  get 'about', to: 'about#index'
  get 'data_navigation', to: 'data_navigation#index'
  get 'weather_data/:id', to: 'weather_data#show'
  get 'location/:id', to: 'location#show'
  get '/search', to: 'data_navigation#index', as: 'search'

  resources :weather_data, only: [:show]
  resources :location, only: [:show]

  get '*path', to: 'errors#not_found'
end
