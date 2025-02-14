class OrdersController < ApplicationController
  before_action :authenticate_employee!




  def new
    @order = Order.new
  end
  def show
    @order = Order.find(params[:id])
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.order_employee = current_employee
    @order.completed = false
    @order.dateordered = Time.now

    if @order.save
      redirect_to root_path, notice: "Order was successfully created."
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: "Order was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: "Order was successfully destroyed."
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:dateordered, :order_employee_id, :delivery_employee_id, pizzas_attributes: [ :size_id, :cheese_id, :sauce_id, topping_ids: [] ])
    end
end
