class Item < ApplicationRecord
  belongs_to :category
  has_many :deals , through: :deal_items
end
