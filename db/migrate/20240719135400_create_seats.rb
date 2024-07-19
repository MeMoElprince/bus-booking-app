class CreateSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :seats do |t|
      t.integer :number

      t.timestamps
    end
  end
end
