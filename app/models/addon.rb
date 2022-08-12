class Addon < ApplicationRecord
  has_many :items , through: :item_addons
end
