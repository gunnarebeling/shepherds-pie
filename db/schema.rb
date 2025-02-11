# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_11_204016) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cheeses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "dateordered"
    t.boolean "completed"
    t.bigint "order_employee_id", null: false
    t.bigint "delivery_employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_employee_id"], name: "index_orders_on_delivery_employee_id"
    t.index ["order_employee_id"], name: "index_orders_on_order_employee_id"
  end

  create_table "pizza_toppings", force: :cascade do |t|
    t.bigint "pizza_id", null: false
    t.bigint "topping_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pizza_id"], name: "index_pizza_toppings_on_pizza_id"
    t.index ["topping_id"], name: "index_pizza_toppings_on_topping_id"
  end

  create_table "pizzas", force: :cascade do |t|
    t.bigint "size_id", null: false
    t.bigint "cheese_id", null: false
    t.bigint "sauce_id", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cheese_id"], name: "index_pizzas_on_cheese_id"
    t.index ["order_id"], name: "index_pizzas_on_order_id"
    t.index ["sauce_id"], name: "index_pizzas_on_sauce_id"
    t.index ["size_id"], name: "index_pizzas_on_size_id"
  end

  create_table "sauces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.string "size"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "toppings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders", "employees", column: "delivery_employee_id"
  add_foreign_key "orders", "employees", column: "order_employee_id"
  add_foreign_key "pizza_toppings", "pizzas"
  add_foreign_key "pizza_toppings", "toppings"
  add_foreign_key "pizzas", "cheeses"
  add_foreign_key "pizzas", "orders"
  add_foreign_key "pizzas", "sauces"
  add_foreign_key "pizzas", "sizes"
end
