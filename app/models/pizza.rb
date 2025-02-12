class Pizza < ApplicationRecord
  belongs_to :size
  belongs_to :cheese
  belongs_to :sauce
  belongs_to :order
  has_many :pizza_toppings
  has_many :toppings, through: :pizza_toppings
  accepts_nested_attributes_for :toppings, allow_destroy: true

  def total_price
    base_price = self.size.price
    toppings_price = self.toppings.count * 0.50
    base_price + toppings_price
  end
end
