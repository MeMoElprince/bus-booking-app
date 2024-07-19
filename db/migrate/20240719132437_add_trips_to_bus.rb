class AddTripsToBus < ActiveRecord::Migration[7.0]
  def change
    add_reference :buses, :trip, null: false, foreign_key: true
  end
end
