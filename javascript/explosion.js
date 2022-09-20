import Vector from './vector.js';

export default class Explosion {
  live = true;
  position = new Vector();
  radius = 0;
  size = 64;
  time = 0;
  duration = 32;

  // Position to explode
  constructor(position) {
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

  update() {
    this.time++;
    this.radius =
      this.size -
      Math.abs((this.duration - this.time) * (this.size / this.duration));
    if (this.time > this.duration * 2) this.live = false;
  }
}
