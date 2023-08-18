import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "text"];

  connect() {
    // Hide the "What made you smile today?" text initially
    this.textTarget.style.display = "none";
  }

  toggleText() {
    this.buttonTarget.style.display = "none";
    this.textTarget.style.display = "block";
  }
}
