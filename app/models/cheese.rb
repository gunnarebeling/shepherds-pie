class Cheese < ApplicationRecord
  has_many :pizzas
  validates :name, presence: true
end
