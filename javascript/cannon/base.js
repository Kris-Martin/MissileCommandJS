import { images } from '../missile-command.js';
import Vector from '../vector.js';

export default class Base {
  image = images.cannonBase;

  width = 80;
  height = 24;
  position = new Vector();

  constructor(canvasWidth, canvasHeight) {
    this.position.x = canvasWidth / 2 - this.width / 2;
    this.position.y = canvasHeight - this.height;
  }

  // Draw base
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
