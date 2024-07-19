class AddCity1AndCity2ToRoutes < ActiveRecord::Migration[7.0]
  def change
    add_reference :routes, :city1
    add_reference :routes, :city2
  end
end
