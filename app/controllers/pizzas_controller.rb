class PizzasController < ApplicationController
  protect_from_forgery with: :null_session

  def update
    @pizza = Pizza.find(params[:id])
    order = @pizza.order_id
    binding.pry
    if @pizza.update(pizza_params)
      respond_to do |format|
        format.json { render json: { redirect_url: order_path(order) }, status: :ok }
        format.html { redirect_to order_path(@pizza.order), notice: "Pizza was successfully updated." }
      end
    else
      respond_to do |format|
        format.json { render json: @pizza.errors, status: :unprocessable_entity }
        format.html { render :edit }
      end
    end
  end

  private

  def pizza_params
    params.require(:pizza).permit(:id, :size_id, :cheese_id, :sauce_id, topping_ids: [])
  end
end
