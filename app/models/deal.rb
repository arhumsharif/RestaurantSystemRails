class Deal < ApplicationRecord
  has_many :items , through: :deal_items
end
