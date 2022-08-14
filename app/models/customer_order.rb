class CustomerOrder < ApplicationRecord
  belongs_to :customers
  belongs_to :orders
end
