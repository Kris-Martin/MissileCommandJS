import Explosion from './explosion.js';
import Vector from './vector.js';

export default class Missile {
  live = true;
  width = 8;
  height = 8;
  position = new Vector();
  velocity = new Vector();
  speed = 4;
  target = new Vector();
  explosions = new Array();

  /**
   * Create a missile.
   * @param {Vector} position - starting position
   * @param {Vector} target - the position to target
   * @param {number} speed - speed of missile
   */
  constructor(position, target, speed) {
    this.position.set(position);
    this.target.set(target);
    this.speed = speed;
    this.velocity.set(
      target.subtract(this.position).normalised.multiply(this.speed),
    );
  }

  /**
   * Draw missile.
   * @param {CanvasRenderingContext2D} ctx - canvas context
   * @param {number} canvasWidth
   * @param {number} canvasHeight
   */
  draw(ctx, canvasWidth, canvasHeight) {
    if (this.live) {
      ctx.lineWidth = 2;
      ctx.beginPath();
      ctx.arc(this.position.x, this.position.y, this.width, 0, 2 * Math.PI);
      ctx.fillStyle = `red`;
      ctx.fill();
      ctx.strokeStyle = 'yellow';
      ctx.stroke();
      this.update(canvasWidth, canvasHeight);
    }
    this.explosions.forEach((explosion) => explosion.draw(ctx));
  }

  /**
   * Update missile position.
   * @param {number} canvasWidth
   * @param {number} canvasHeight
   */
  update(canvasWidth, canvasHeight) {
    // Add explosion if hits ground
    if (this.position.y >= canvasHeight - 15 && this.explosions.length < 1)
      this.explosions.push(new Explosion(this.position));

    // If out of bounds set live to false
    // - +128 allows time for explosion to finish
    if (
      !(
        this.position.y < 0 ||
        this.position.y > canvasHeight + 128 ||
        this.position.x < 0 ||
        this.position.x > canvasWidth + 128
      )
    ) {
      this.position.set(this.position.add(this.velocity));
    } else {
      this.live = false;
    }
  }
}
