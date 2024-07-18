Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cities, only: [:index, :create, :destroy, :update, :show]
    end
  end
end
