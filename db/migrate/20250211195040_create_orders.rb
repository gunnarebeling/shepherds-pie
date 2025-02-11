class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.datetime :dateordered
      t.boolean :completed
      t.references :order_employee, null: false,  foreign_key: { to_table: :employees }
      t.references :delivery_employee, null: true, foreign_key: { to_table: :employees }

      t.timestamps
    end
  end
end
