class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.references :item, null: false, foreign_key: true
      t.string :category_name
      t.string :restaurant_name

      t.timestamps
    end
  end
end
