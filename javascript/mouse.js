import { canvas, cannon } from './missile-command.js';
import Vector from './vector.js';

export default class Mouse {
  clicked = false;
  position = new Vector(0, 0);

  constructor() {
    canvas.element.addEventListener('mousemove', this.setPosition, false);
    canvas.element.addEventListener('click', this.setClicked, false);
  }

  setPosition(e) {
    const bounds = canvas.element.getBoundingClientRect();
    this.position = new Vector(e.clientX - bounds.left, e.clientY - bounds.top);
    cannon.setAngle(this.position);
  }

  setClicked(e) {
    if (e.type === 'click') {
      console.log('fire!');
      this.clicked = true;
    } else {
      this.clicked = false;
    }
  }
}
