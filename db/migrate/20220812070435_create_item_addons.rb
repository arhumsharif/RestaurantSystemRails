class CreateItemAddons < ActiveRecord::Migration[6.1]
  def change
    create_table :item_addons do |t|
      t.references :item, null: false, foreign_key: true
      t.references :addon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
