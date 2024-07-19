class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|

      t.timestamps
    end
  end
end
