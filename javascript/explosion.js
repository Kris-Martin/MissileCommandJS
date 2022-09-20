import Vector from './vector.js';

export default class Explosion {
  live = true;
  position = new Vector();
  radius = 0;
  size;
  time = 0;
  duration;

  /**
   * Create explosion.
   * @param {Vector} position - explode here
   */
  constructor(position, size = 64, duration = 32) {
    this.size = size;
    this.duration = duration;
    this.position.set(position);
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
