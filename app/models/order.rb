class Order < ApplicationRecord
  has_many :pizzas, dependent: :destroy
  belongs_to :order_employee, class_name: "Employee", foreign_key: "order_employee_id"
  belongs_to :delivery_employee, class_name: "Employee", foreign_key: "delivery_employee_id", optional: true
  accepts_nested_attributes_for :pizzas, allow_destroy: true

  def price_total
    self.pizzas.map(&:total_price).sum
  end
end
