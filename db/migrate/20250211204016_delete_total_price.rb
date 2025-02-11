class DeleteTotalPrice < ActiveRecord::Migration[8.0]
  def change
    remove_column :pizzas, :total_price
  end
end
