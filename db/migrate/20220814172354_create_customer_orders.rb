class CreateCustomerOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_orders do |t|
      t.references :customers, null: false, foreign_key: true
      t.references :orders, null: false, foreign_key: true
      t.string :date

      t.timestamps
    end
  end
end
