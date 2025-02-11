class Size < ApplicationRecord
  has_many :pizzas
  validates :size, presence: true
  validates :price, presence: true
end
