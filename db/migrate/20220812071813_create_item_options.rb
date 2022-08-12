class CreateItemOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :item_options do |t|
      t.references :item, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
