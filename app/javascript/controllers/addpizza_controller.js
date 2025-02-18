import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addpizza"
export default class extends Controller {
  static targets = ["addPizzaButton", "savePizzaButton", "pizzaForm", "pizzas", "pizzaId", "pizzaSize", "pizzaCheese", "pizzaSauce", "pizzaToppings"]

  connect() {
    this.pizzaModal = new bootstrap.Modal(this.element.querySelector("#pizzaModal"))
    console.log("Connected to addpizza controller")
  }

  showModal(event) {
    event.preventDefault()
    this.pizzaModal.show()
  }

  editPizza(event) {
    event.preventDefault()
    const pizza = event.currentTarget.dataset.pizza
    this.loadForm(JSON.parse(pizza))
    this.pizzaModal.show()
  }

  async savePizza() {
    const formData = new FormData(this.pizzaFormTarget)
    const pizzaId = this.pizzaIdTarget.value
    let pizzaFields
    

    if (pizzaId) {
      // Update existing pizza
      const url = `/pizzas/${pizzaId}`
      let pizzaObj = Object.fromEntries(formData)
      pizzaObj.topping_ids = Array.from(this.pizzaFormTarget.querySelectorAll(".form-check-input:checked")).map(el => el.value)
      const response = await fetch(url, {
        method: 'PUT',
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ pizza: pizzaObj })
      })
  
      if (response.ok) {
        const updatedPizza = await response.json()
        console.log(updatedPizza);
        
        window.location.href = updatedPizza.redirect_url
      } else {
        console.error('Failed to update pizza:', response.statusText)
      }
    
     
    } else {
      // Create new pizza
      pizzaFields = document.createElement("div")
      pizzaFields.classList.add("pizza-fields")
      pizzaFields.dataset.pizzaId = pizzaId
      formData.forEach((value, key) => {
        const input = document.createElement("input")
        input.type = "hidden"
        input.name = `order[pizzas_attributes][][${key}]`
        input.value = value
        pizzaFields.appendChild(input)
      })
  
      const toppingIds = Array.from(this.pizzaFormTarget.querySelectorAll(".form-check-input:checked")).map(el => el.value)
      toppingIds.forEach(toppingId => {
        const input = document.createElement("input")
        input.type = "hidden"
        input.name = "order[pizzas_attributes][][topping_ids][]"
        input.value = toppingId
        pizzaFields.appendChild(input)
      })
  
      const pizzaTemplate = `
        <div class="pizza-template container border p-3 my-3">
          <p>Size: ${this.pizzaFormTarget.querySelector('#pizza_size_id option:checked').textContent}</p>
          <p>Cheese: ${this.pizzaFormTarget.querySelector('#pizza_cheese_id option:checked').textContent}</p>
          <p>Sauce: ${this.pizzaFormTarget.querySelector('#pizza_sauce_id option:checked').textContent}</p>
          <p>Toppings: ${Array.from(this.pizzaFormTarget.querySelectorAll('.form-check-input:checked')).map(el => el.nextElementSibling.textContent).join(', ')}</p>
        </div>
      `
      pizzaFields.innerHTML += pizzaTemplate
      this.pizzasTarget.appendChild(pizzaFields)
    }

    this.pizzaModal.hide()
  }

  loadForm(pizza) {
    this.pizzaIdTarget.value = pizza.id
    this.pizzaSizeTarget.value = pizza.size_id
    this.pizzaCheeseTarget.value = pizza.cheese_id
    this.pizzaSauceTarget.value = pizza.sauce_id
    const toppingIds = pizza.toppings || []
    this.pizzaToppingsTargets.forEach(topping => {
      topping.checked = toppingIds.some( t => t.id === Number(topping.value))
    })
  }

  clearForm() {
    this.pizzaFormTarget.reset()
    this.pizzaIdTarget.value = ""
  }
}