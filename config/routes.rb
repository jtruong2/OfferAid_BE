Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :user, only: [:show, :create, :update] do
        get "/donations/:donation_id", to: 'donations#show'
        get "/donations", to: 'donations#index'
        get "/donations/:donation_id/items", to: 'items#index'
        post "/donations/:donation_id/items", to: 'items#create'
        post "/donations", to: 'donations#create'
        get "/items", to: 'items#show'
        post "/alexa_donations", to: 'alexa_donations#create'
      end

      get '/items', to: 'all_items#index'
      post "/login", to: 'sessions#create'
      delete "/logout", to: 'sessions#destroy'
      get "/current_user", to: 'sessions#show'
    end
  end
end
