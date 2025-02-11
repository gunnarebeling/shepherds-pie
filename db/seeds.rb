# Clear existing data to prevent duplication on reseeding

Order.destroy_all
Pizza.destroy_all
Topping.destroy_all
Size.destroy_all
Cheese.destroy_all
Sauce.destroy_all
Employee.destroy_all

# Create Employees with Devise fields (email, password)
employee1 = Employee.create!(name: "John Doe", email: "john@example.com", password: "password123", password_confirmation: "password123")
employee2 = Employee.create!(name: "Jane Smith", email: "jane@example.com", password: "password123", password_confirmation: "password123")
employee3 = Employee.create!(name: "Mike Johnson", email: "mike@example.com", password: "password123", password_confirmation: "password123")

# Create Sizes
small = Size.create!(size: "Small", price: 8.99)
medium = Size.create!(size: "Medium", price: 12.99)
large = Size.create!(size: "Large", price: 15.99)

# Create Cheeses
mozzarella = Cheese.create!(name: "Mozzarella")
cheddar = Cheese.create!(name: "Cheddar")
parmesan = Cheese.create!(name: "Parmesan")

# Create Sauces
tomato = Sauce.create!(name: "Tomato Sauce")
alfredo = Sauce.create!(name: "Alfredo Sauce")
bbq = Sauce.create!(name: "BBQ Sauce")

# Create Toppings
pepperoni = Topping.create!(name: "Pepperoni")
mushrooms = Topping.create!(name: "Mushrooms")
onions = Topping.create!(name: "Onions")
green_peppers = Topping.create!(name: "Green Peppers")
bacon = Topping.create!(name: "Bacon")

# Create Pizzas

# Associate Toppings with Pizzas
puts "Employee 1: #{employee1.inspect}"
puts "Employee 2: #{employee2.inspect}"
puts "Employee 3: #{employee3.inspect}"
# Create Orders
order1 = Order.create!(
  dateordered: Time.now,
  order_employee_id: employee1.id,  # Correct foreign key usage
  delivery_employee_id: employee2.id,  # Correct foreign key usage
  completed: false
)
order2 = Order.create!(
  dateordered: Time.now,
  order_employee_id: employee1.id,  # Correct foreign key usage
  delivery_employee_id: employee3.id,  # Correct foreign key usage
  completed: false
)

pizza1 = Pizza.create!(
  size: medium,
  cheese: mozzarella,
  sauce: tomato,
  order: order1
  )
pizza2 = Pizza.create!(
  size: large,
  cheese: cheddar,
  sauce: bbq,
  order: order2
  )
pizza1.toppings << [ pepperoni, mushrooms ]
pizza2.toppings << [ bacon, onions, green_peppers ]
# Associate Pizzas with Orders


puts "Seed data successfully created!"
