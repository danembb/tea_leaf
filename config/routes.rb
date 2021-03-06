Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :teas, only: [:create, :index]
      resources :customers, only: [:create] do
        resources :subscriptions, only: [:create, :update, :index]
      end
    end
  end
end
