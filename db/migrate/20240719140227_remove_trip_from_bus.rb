class RemoveTripFromBus < ActiveRecord::Migration[7.0]
  def change
    remove_reference :buses, :trip, null: false, foreign_key: true
  end
end
