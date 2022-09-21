import Canvas from './canvas.js';
import Vector from './vector.js';

export default class Explosion {
  live = true;
  position = new Vector();
  radius = 0;
  defaultSize = 64;
  size = this.defaultSize;
  time = 0;
  duration = 32;

  static currentSize = this.defaultSize;

  /**
   * Create explosion.
   * @param {Vector} position - explode here
   * @param {Canvas} canvas
   */
  constructor(position, canvas) {
    this.size = (this.defaultSize / canvas.defaultWidth) * canvas.width;
    this.position.set(position);

    Explosion.currentSize = this.size;
  }

  /**
   * Draw explosion.
   * @param {CanvasRenderingContext2D} ctx - canvas context
   */
  draw(ctx) {
    if (this.live) {
      ctx.lineWidth = 2;
      ctx.beginPath();
      ctx.arc(this.position.x, this.position.y, this.radius, 0, 2 * Math.PI);
      ctx.fillStyle = `rgb(240, 80, 80)`;
      ctx.fill();
      ctx.strokeStyle = 'yellow';
      ctx.stroke();
      this.update();
    }
  }
  /**
   * Update radius and status of explosion.
   * Radius grows and shrinks over duration.
   */
  update() {
    this.time++;
    this.radius =
      this.size -
      Math.abs((this.duration - this.time) * (this.size / this.duration));
    if (this.time > this.duration * 2) this.live = false;
  }
}
