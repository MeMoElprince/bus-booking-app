class AddBusToSeats < ActiveRecord::Migration[7.0]
  def change
    add_reference :seats, :bus, null: false, foreign_key: true
  end
end
