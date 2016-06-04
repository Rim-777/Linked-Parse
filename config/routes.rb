require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  use_doorkeeper

  namespace :api do
    namespace :v1 do
      resources :users
      resource :search, only: :search do
        get :search
      end
      # resources :skills
    end
  end

  root to: "doorkeeper/applications#index"
end
