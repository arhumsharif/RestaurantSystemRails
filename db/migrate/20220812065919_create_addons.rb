class CreateAddons < ActiveRecord::Migration[6.1]
  def change
    create_table :addons do |t|
      t.string :addon_name

      t.timestamps
    end
  end
end
