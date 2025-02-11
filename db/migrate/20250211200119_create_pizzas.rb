class CreatePizzas < ActiveRecord::Migration[8.0]
  def change
    create_table :pizzas do |t|
      t.references :size, null: false, foreign_key: true
      t.references :cheese, null: false, foreign_key: true
      t.references :sauce, null: false, foreign_key: true
      t.decimal :total_price
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
