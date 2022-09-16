import { canvas, cannon } from '../missile-command.js';

export default class Mouse {
  clicked = false;
  posX;
  posY;

  constructor() {
    canvas.element.addEventListener('mousemove', this.setPosition, false);
    canvas.element.addEventListener('click', this.setClicked, false);
  }

  setPosition(e) {
    const bounds = canvas.element.getBoundingClientRect();
    this.posX = e.clientX - bounds.left;
    this.posY = e.clientY - bounds.top;
    cannon.setAngle(this.posX, this.posY);
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
