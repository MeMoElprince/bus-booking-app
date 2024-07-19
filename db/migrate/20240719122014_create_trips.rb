class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.time :departure_time

      t.timestamps
    end
  end
end
