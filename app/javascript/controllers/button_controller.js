import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button"
export default class extends Controller {
  static targets = ["button"]

  connect() {
  }

  togglemap(event) {
    this.buttonTarget.classList.toggle("d-none")
    let txt = event.currentTarget.innerText
    if (txt === "Cacher la map") {
      event.currentTarget.innerText = "Cacher la map"
    } else {
      event.currentTarget.innerText = "Afficher la map"
    }
  }
}
