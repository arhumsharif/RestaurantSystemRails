class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.integer :manager_id
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
