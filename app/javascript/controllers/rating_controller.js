// app/javascript/controllers/rating_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["star"];

  connect() {
    console.log("Rating controller connected");
  }

  rate(event) {
    let selectedStar = event.currentTarget;
    this.starTargets.forEach(star => star.classList.remove("selected"));
    selectedStar.classList.add("selected");
  }
}
