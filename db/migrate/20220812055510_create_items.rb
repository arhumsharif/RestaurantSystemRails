class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :item_desc
      t.string :price
      t.string :restaurant_name

      t.timestamps
    end
  end
end
