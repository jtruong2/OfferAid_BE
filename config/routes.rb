Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :user, only: [:show, :create, :update]
      get "/user/:user_id/donations/:donation_id", to: 'donations#show'
      get "/user/:user_id/donations", to: 'donations#index'
      get "/user/:user_id/donations/:donation_id/items", to: 'items#index'
      post "/user/:user_id/donations/:donation_id/items", to: 'items#create'
    end
  end
end
