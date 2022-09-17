import Vector from './vector.js';

export default class Missile {
  live = true;
  width = 8;
  height = 8;
  position = new Vector();
  velocity = new Vector();
  speed = 4;
  target = new Vector();

  /**
   * Create a missile.
   * @param {Vector} position - starting position
   * @param {Vector} target - the position to target
   */
  constructor(position, target) {
    this.position.set(position);
    this.target.set(target);
    this.velocity.set(
      target.subtract(this.position).normalised.multiply(this.speed),
    );
  }

  /**
   * Draw missile.
   * @param {CanvasRenderingContext2D} ctx - canvas context
   */
  draw(ctx) {
    ctx.beginPath();
    ctx.arc(this.position.x, this.position.y, this.width, 0, 2 * Math.PI);
    ctx.stroke();
    this.update();
  }

  update() {
    this.position.set(this.position.add(this.velocity));
  }
}
