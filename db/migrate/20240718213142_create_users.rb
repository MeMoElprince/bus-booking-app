class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :password_confirm
      t.string :phone

      t.timestamps
    end
  end
end
