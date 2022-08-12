class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.references :item, null: false, foreign_key: true
      t.string :Discount

      t.timestamps
    end
  end
end
