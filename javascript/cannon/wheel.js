import { images } from '../missile-command.js';
import Vector from '../vector.js';

export default class Wheel {
  image = images.cannonWheel;

  width = 50;
  height = 50;
  position = new Vector();

  constructor(canvasWidth, canvasHeight) {
    this.position.x = canvasWidth / 2 - this.width / 2;
    this.position.y = canvasHeight - this.height;
  }

  // Draw wheel
  draw(ctx) {
    ctx.drawImage(
      this.image,
      this.position.x,
      this.position.y,
      this.width,
      this.height,
    );
  }
}
