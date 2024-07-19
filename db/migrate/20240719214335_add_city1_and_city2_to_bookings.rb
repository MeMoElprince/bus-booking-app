class AddCity1AndCity2ToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :city1, foreign_key: { to_table: :cities }
    add_reference :bookings, :city2, foreign_key: { to_table: :cities }
  end
end
