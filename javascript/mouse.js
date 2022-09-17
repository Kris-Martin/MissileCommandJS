import { canvas, cannon } from './missile-command.js';
import Vector from './vector.js';

export default class Mouse {
  position = new Vector(0, 0);

  constructor() {
    canvas.element.addEventListener('mousemove', this.setPosition, false);
    canvas.element.addEventListener('click', this.setClicked, false);
  }

  /**
   * Store current position of mouse on canvas.
   * @param {Event} e - event
   */
  setPosition(e) {
    const bounds = canvas.element.getBoundingClientRect();
    this.position = new Vector(e.clientX - bounds.left, e.clientY - bounds.top);
    cannon.setAngle(this.position);
  }

  /**
   * Store result of clicked event.
   * @param {Event} e - event
   */
  setClicked(e) {
    if (e.type === 'click') cannon.fire(this.position);
  }
}
