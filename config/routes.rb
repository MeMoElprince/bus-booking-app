Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        collection do
          post :signup
          post :login
        end
      end
      resources :cities, only: [:index, :create, :destroy, :update, :show]
      resources :routes, only: [:index, :create, :destroy, :update]
    end
  end
end
