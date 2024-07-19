Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :trips do
        # /api/v1/trips/:id/routes/:route_id/
        get '/:trip_id/routes', to: 'trip_routes#index'
        post '/:trip_id/routes/:route_id', to: 'trip_routes#create'
        resources :trip_routes, only: [:update, :destroy, :show]
      end
      resources :users, only: [] do
        collection do
          post :signup
          post :login
        end
      end
      resources :cities, only: [:index, :create, :destroy, :update, :show]
      resources :routes, only: [:index, :create, :destroy, :update]
      resources :trips, only: [:index, :create, :destroy, :update, :show]
      resources :buses, only: [:index, :create, :destroy, :show]
    end
  end
end
