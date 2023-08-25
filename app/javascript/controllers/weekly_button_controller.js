import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weekly-button"
export default class extends Controller {
  static targets = ["button"];

  connect() {
    console.log("weekly btn works")
    if (sessionStorage.getItem("buttonClicked") === "true") {
      this.buttonTarget.classList.add("d-none");
    }
  }

  hideButton() {
    console.log("weekly btn is for sure working")
    this.buttonTarget.classList.add("d-none");
    sessionStorage.setItem("buttonClicked", "true");
    // this.textTarget.style.display = "block";
  }
}
