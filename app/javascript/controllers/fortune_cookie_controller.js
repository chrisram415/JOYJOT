import { Controller } from "@hotwired/stimulus"
// import { TimelineMax } from "gsap/all";
import { gsap } from "gsap"; // Import gsap instead of specific classes


// Connects to data-controller="fortune-cookie"
export default class extends Controller {
  // static targets = [,];
  static targets = ["fortune", "fortuneLeft", "fortuneRight", "fortuneMessage"];


  connect() {
    // test code
    console.log(this.fortuneTarget)
    console.log("We are live!");
    this.rotateFortune();
    // // Delay the start of the animation by 1 second = (1000 milliseconds)
    // setTimeout(() => {
    //   this.rotateFortune();
    // }, 1000);
  }

  rotateFortune() {
    // const tl = new TimelineMax({ yoyo: true, repeat: -1, repeatDelay: 3 });
    // const tl = gsap.timeline({ yoyo: true, repeat: -1, repeatDelay: 0.5 });
    // replace the cycle code for do it once
    const tl = gsap.timeline();
    // const fortune = this.element;
    const fortune = this.fortuneTarget;
    const fortuneLeft = this.fortuneLeftTarget;
    const fortuneRight = this.fortuneRightTarget;
    const fortuneMessage = this.fortuneMessageTarget;

    // Animation for fortune rotation
    tl.to(fortune, { rotation: 2, delay: 1.5, duration: 0.07 });
    tl.to(fortune, { rotation: -5, duration: 0.07 });
    tl.to(fortune, { rotation: 2, duration: 0.07 });
    tl.to(fortune, { rotation: -5, duration: 0.07 });
    tl.to(fortune, { rotation: 2, duration: 0.07 });
    tl.to(fortune, { rotation: 0, duration: 0.07 });
    tl.addLabel('break', '+=0.15');

    // Calculate the duration of the message animation and apply it to the left and right animations
    const messageDuration = 7; // Set the duration to 7 seconds
    const leftRightDuration = (messageDuration - 0.5) / 2; // Subtract the delay and divide by 2

    tl.to(fortuneLeft, { rotation: -45, x: -30, y: 70, duration: leftRightDuration }, 'break'); // Adjust the duration
    tl.to(fortuneRight, { rotation: 45, x: 30, y: 70, duration: leftRightDuration }, 'break'); // Adjust the duration

    // tl.to(fortuneLeft, { rotation: -45, x: -70, y: 70, duration: 0.25 }, 'break');
    // tl.to(fortuneRight, { rotation: 45, x: 70, y: 70, duration: 0.25 }, 'break');
    // tl.from(fortuneMessage, { x: '110%', duration: 1 }, 'break');

    // tl.from(fortuneMessage, {
    //   x: '0%',
    //   duration: messageDuration, // Set the duration to 7 seconds
    //   delay: 0,
    //   opacity: 0,
    //   onStart: () => {
    //     fortuneMessage.classList.add('active');
    //   },
    //   onComplete: () => {
    //     fortuneMessage.classList.remove('active');
    //   }
    // }, 'break');

    // Animation for fortuneMessage opacity and position
    tl.fromTo(
      fortuneMessage,
      { x: '0%', opacity: 0 },
      {
        x: '0%',
        opacity: 1,
        duration: messageDuration,
        delay: 0,
        onStart: () => {
          fortuneMessage.classList.add('active');
        },
        onComplete: () => {
          fortuneMessage.classList.remove('active');
        }
      },
      'break'
    );

  }

}
