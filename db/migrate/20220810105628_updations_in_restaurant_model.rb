class UpdationsInRestaurantModel < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :status, :string
    add_column :restaurants, :open_time, :string
    add_column :restaurants, :close_time, :string
  end
end
