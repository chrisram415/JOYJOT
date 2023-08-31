import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fake-weekly-button"
export default class extends Controller {
  static targets = ["button"];

  connect() {
    console.log("fake weekly btn works")
  }



  hideButton() {
    console.log("yay it displays")
    this.buttonTarget.classList.remove('d-none');
  }
}
