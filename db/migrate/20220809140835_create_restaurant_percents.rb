class CreateRestaurantPercents < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_percents do |t|
      t.string :restaurant_name
      t.float :percent
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
