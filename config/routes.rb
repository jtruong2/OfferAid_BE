Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :user do
        get '/:id', to: 'user#show'
        post '', to: 'user#create'
      end
    end
  end
end
