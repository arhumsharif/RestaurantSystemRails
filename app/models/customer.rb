class Customer < ApplicationRecord
  has_many :orders , through: :customer_orders
end
