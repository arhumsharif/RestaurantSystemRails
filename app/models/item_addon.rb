class ItemAddon < ApplicationRecord
  belongs_to :item
  belongs_to :addon
end
