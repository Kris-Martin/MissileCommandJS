import { images } from '../missile-command.js';
import Vector from '../vector.js';

export default class Wheel {
  image = images.cannonWheel;

  defaultWidth = 50;
  defaultHeight = 50;
  width = this.defaultWidth;
  height = this.defaultHeight;
  position = new Vector();

  /**
   * Create Wheel
   * @param {Canvas} canvas
   */
  constructor(canvas) {
    this.width = (this.defaultWidth / canvas.defaultWidth) * canvas.width;
    this.height = (this.defaultHeight / canvas.defaultHeight) * canvas.height;
    this.position.x = canvas.width / 2 - this.width / 2;
    this.position.y = canvas.height - this.height;
  }

  /**
   * Draw wheel.
   * @param {CanvasRenderingContext2D} ctx - canvas context
   */
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
