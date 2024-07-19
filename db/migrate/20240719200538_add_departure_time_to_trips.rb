class AddDepartureTimeToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :departure_time, :datetime
  end
end
