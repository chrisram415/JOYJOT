// app/javascript/controllers/shaking_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  shake(event) { // define action named 'shake' that's automatically called when the element is clicked
    const shakingButton = this.buttonTarget;
    shakingButton.classList.add("shake"); // adds the "shake" class to the target element

    // Remove the shake class after the animation completes
    shakingButton.addEventListener("animationend", () => {
      shakingButton.classList.remove("shake");
    }, { once: true });
  }
}
