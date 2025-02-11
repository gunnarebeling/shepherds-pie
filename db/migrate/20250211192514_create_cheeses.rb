class CreateCheeses < ActiveRecord::Migration[8.0]
  def change
    create_table :cheeses do |t|
      t.string :name

      t.timestamps
    end
  end
end
