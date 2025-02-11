class CreateSizes < ActiveRecord::Migration[8.0]
  def change
    create_table :sizes do |t|
      t.string :size
      t.decimal :price

      t.timestamps
    end
  end
end
