class Order < ApplicationRecord
  belongs_to :order_items
  has_many :customers , through: :customer_orders
end
