class Sauce < ApplicationRecord
  has_many :pizzas
  validates :name, presence: true
end
