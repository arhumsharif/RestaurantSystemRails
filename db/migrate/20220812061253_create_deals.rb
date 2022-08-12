class CreateDeals < ActiveRecord::Migration[6.1]
  def change
    create_table :deals do |t|
      t.string :deal_name
      t.string :price

      t.timestamps
    end
  end
end
