import Canvas from './canvas.js';
import Vector from './vector.js';

export default class Mouse {
  position = new Vector(0, 0);

  constructor() {}

  /**
   * Store current position of mouse on canvas.
   * @param {Event} e - event
   * @param {Canvas} e - canvas
   */
  setPosition(e, canvas) {
    const bounds = canvas.element.getBoundingClientRect();
    this.position = new Vector(e.clientX - bounds.left, e.clientY - bounds.top);
  }
}
