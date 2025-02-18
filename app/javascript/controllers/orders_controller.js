import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="orders"
export default class extends Controller {
  static targets = [ "saveButton" ]
  connect() {
    this.Modal = new bootstrap.Modal(this.element.querySelector("#editDeliveryEmployeeModal"))
  }

  showOrderModal(event) {
    event.preventDefault()
    this.Modal.show()
  }

  
}
