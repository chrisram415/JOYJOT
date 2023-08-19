import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content", "text"];

  connect() {
    // Hide the "What made you smile today?" text initially
    // this.textTarget.style.display = "none";
    console.log("Hiii")
  }

  toggleText() {
    this.contentTarget.classList.add("d-none");
    this.textTarget.style.display = "block";
  }
}
