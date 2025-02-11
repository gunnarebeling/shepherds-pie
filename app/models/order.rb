class Order < ApplicationRecord
  has_many :pizzas
  belongs_to :order_employee, class_name: "Employee", foreign_key: "order_employee_id"
  belongs_to :delivery_employee, class_name: "Employee", foreign_key: "delivery_employee_id", optional: true

  def price_total
    self.pizzas.map(&:total_price).sum
  end
end
