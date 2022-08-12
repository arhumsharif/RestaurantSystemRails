class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :item, null: false, foreign_key: true
      t.string :restaurant_name
      t.string :price
      t.string :quantity

      t.timestamps
    end
  end
end
