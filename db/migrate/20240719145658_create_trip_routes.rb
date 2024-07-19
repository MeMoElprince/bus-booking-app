class CreateTripRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :trip_routes do |t|

      t.timestamps
    end
  end
end
