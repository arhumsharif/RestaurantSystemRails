class AddPriceToOptions < ActiveRecord::Migration[6.1]
  def change
    add_column :options, :price, :string
    add_column :addons, :price, :string
  end
end
