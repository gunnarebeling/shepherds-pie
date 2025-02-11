class HomeController < ApplicationController
  before_action :authenticate_employee!
  def index
    # Add any logic you need for the index action here
    @orders = Order.includes(:order_employee, :delivery_employee, pizzas: [ :size, :cheese, :sauce, :toppings ]).all
    if params[:start_date].present?
      @orders = @orders.where("DATE(dateordered) = ?", params[:start_date])
    end
  end
end
