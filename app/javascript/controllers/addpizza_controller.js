import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addpizza"
export default class extends Controller {
  static targets = ["addPizzaButton", "savePizzaButton", "pizzaForm", "pizzas"]

  connect() {
    this.pizzaModal = new bootstrap.Modal(this.element.querySelector("#pizzaModal"))
    console.log("Connected to addpizza controller")
  }

  showModal(event) {
    event.preventDefault()
    this.pizzaModal.show()
  }

  savePizza() {
    const formData = new FormData(this.pizzaFormTarget)
    const pizzaFields = document.createElement("div")
    pizzaFields.classList.add("pizza-fields")

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
    this.pizzaModal.hide()
  }
}