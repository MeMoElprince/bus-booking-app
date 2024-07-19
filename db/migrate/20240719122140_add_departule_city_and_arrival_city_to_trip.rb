class AddDepartuleCityAndArrivalCityToTrip < ActiveRecord::Migration[7.0]
  def change
    add_reference :trips, :departure_city, foreign_key: { to_table: :cities }
    add_reference :trips, :arrival_city, foreign_key: { to_table: :cities }
  end
end
