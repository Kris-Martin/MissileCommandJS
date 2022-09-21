import { images } from '../missile-command.js';
import Vector from '../vector.js';

export default class Barrel {
  image = images.cannonBarrel;

  defaultWidth = 50;
  defaultHeight = 80;
  width = this.defaultWidth;
  height = this.defaultHeight;
  dimension = new Vector();
  position = new Vector();
  midPoint = new Vector();

  /**
   * Create Barrel
   * @param {Canvas} canvas
   */
  constructor(canvas) {
    this.width = (this.defaultWidth / canvas.defaultWidth) * canvas.width;
    this.height = (this.defaultHeight / canvas.defaultHeight) * canvas.height;
    this.dimension.set(new Vector(this.width, this.height));
    this.position.x = canvas.width / 2 - this.width / 2;
    this.position.y = canvas.height - this.height;
    this.midPoint.set(this.position.add(this.dimension.divide(2)));
  }

  /**
   * Draw barrel.
   * @param {CanvasRenderingContext2D} ctx - canvas context
   * @param {number} angle - angle to rotate barrel, in radians
   */
  draw(ctx, angle) {
    // Draw barrel
    // https://gamedev.stackexchange.com/questions/67274/is-it-possible-to-rotate-an-image-on-an-html5-canvas-without-rotating-the-whole
    // Save the current coordinate system before changing it
    ctx.save();

    // Move to the middle of where we want to draw our image
    ctx.translate(this.midPoint.x, this.midPoint.y);

    // Rotate around that point
    ctx.rotate(angle);

    // Draw image relative to new origin using -width/2 and -height/2 as x and y
    ctx.drawImage(
      this.image,
      -this.width / 2,
      -this.height / 2,
      this.width,
      this.height,
    );

    // Restore coordinate system to prev saved state
    ctx.restore();
  }
}
