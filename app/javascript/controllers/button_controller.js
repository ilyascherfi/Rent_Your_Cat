import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button"
export default class extends Controller {
  static targets = ["button"]

  connect() {
  }

  togglemap() {
    this.buttonTarget.classList.toggle("d-none")
  }
}
