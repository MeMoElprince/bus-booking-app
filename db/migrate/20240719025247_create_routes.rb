class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.float :cost
      t.float :duration

      t.timestamps
    end
  end
end
