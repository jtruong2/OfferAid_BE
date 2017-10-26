Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :user, only: [:show, :create, :update]
      get "/user/:user_id/donations/:donation_id", to: 'donations#show'
      get "/user/:user_id/donations", to: 'donations#index'
      get "/user/:user_id/donations/:donation_id/items", to: 'items#index'
      post "/user/:user_id/donations/:donation_id/items", to: 'items#create'
      post "/login", to: 'sessions#create'
      delete "/logout", to: 'sessions#destroy'
      get "/current_user", to: 'sessions#show'
    end
  end
end
