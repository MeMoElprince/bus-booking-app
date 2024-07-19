class AddRouteAndTripToTripRoutes < ActiveRecord::Migration[7.0]
  def change
    add_reference :trip_routes, :route, null: false, foreign_key: true
    add_reference :trip_routes, :trip, null: false, foreign_key: true
  end
end
