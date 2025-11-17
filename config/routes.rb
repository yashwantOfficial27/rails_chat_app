Rails.application.routes.draw do
  root "pages#home"

  # Authentication routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  # Chat rooms
  resources :rooms, only: [:index, :show, :new, :create] do
    resources :messages, only: [:create, :destroy]
  end

  # Health check route for monitoring
  get "up" => "rails/health#show", as: :rails_health_check
end
