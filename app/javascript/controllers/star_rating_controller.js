import { Controller } from "@hotwired/stimulus"
import StarRating from "star-rating.js"

export default class extends Controller {
  connect() {
    console.log("hello")
    new StarRating(this.element, { tooltip: false, maxStars: 10 })
  }

  applyRating(){
    //send details, which star I am on.
    console.log(this.element)
  }
}
