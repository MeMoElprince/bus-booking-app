class AddCity1AndCity2ToRoutes < ActiveRecord::Migration[7.0]
  def change
    add_reference :routes, :city1, foreign_key: { to_table: :cities }
    add_reference :routes, :city2, foreign_key: { to_table: :cities }
  end
end
