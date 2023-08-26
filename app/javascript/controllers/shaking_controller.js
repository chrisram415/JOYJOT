// app/javascript/controllers/shaking_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  shake(event) { // define action named 'shake' that's automatically called when the element is clicked
    event.currentTarget.classList.add("shake"); // adds the "shake" class to the target element
    const button = event.currentTarget
    // Remove the shake class after the animation completes
    event.currentTarget.addEventListener("animationend", () => {
      button.classList.remove("shake");
    });
  }
}
