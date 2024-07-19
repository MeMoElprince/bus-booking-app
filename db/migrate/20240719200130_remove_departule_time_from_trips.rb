class RemoveDepartuleTimeFromTrips < ActiveRecord::Migration[7.0]
  def change
    # remove departure_time column 
    remove_column :trips, :departure_time, :time
  end
end
