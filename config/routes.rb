Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :trips do
        # /api/v1/trips/:id/routes/:route_id/
        get '/:trip_id/routes', to: 'trip_routes#index'
        post '/:trip_id/routes/:route_id', to: 'trip_routes#create'
      end
      resources :users, only: [] do
        collection do
          post :signup
          post :login
        end
      end
      # /api/v1/trip_routes/:id    [delete and get]
      resources :trip_routes, only: [:destroy, :show], controller: 'trips/trip_routes'
      resources :cities, only: [:index, :create, :destroy, :update, :show]
      resources :routes, only: [:index, :create, :destroy, :update]
      resources :trips, only: [:index, :create, :destroy, :update, :show]
      resources :buses, only: [:index, :create, :destroy, :show]
    end
  end
end
