require 'sidekiq/web'
Rails.application.routes.draw do
  apipie
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :users
      resource :search, only: :search do
        get :search
      end
    end
  end
end
