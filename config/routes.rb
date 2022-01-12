Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :teas, only: [:create]
      resources :customers, only: [:create] do
        resources :subscriptions, only: [:create, :update]
      end
    end
  end
end
