class Item < ApplicationRecord
  belongs_to :category
  has_many :deals , through: :deal_items
  has_many :addons , through: :item_addons
  has_many :options , through: :item_options
end
