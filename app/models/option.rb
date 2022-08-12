class Option < ApplicationRecord
  has_many :items , through: :item_options
end
