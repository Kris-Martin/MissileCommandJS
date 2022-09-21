import Background from './background.js';
import Canvas from './canvas.js';
import Explosion from './explosion.js';
import Vector from './vector.js';

export default class Missile {
  live = true;
  defaultWidth = 8;
  defaultHeight = 8;
  width = this.defaultWidth;
  height = this.defaultHeight;
  position = new Vector();
  velocity = new Vector();
  speed = 4;
  target = new Vector();
  explosions = new Array();

  /**
   * Create a missile.
   * @param {Vector} position - starting position
   * @param {Canvas} canvas
   * @param {Vector} target - the position to target
   * @param {number} speed - speed of missile
   */
  constructor(position, canvas, target, speed) {
    this.position.set(position);
    this.width = (this.defaultWidth / canvas.defaultWidth) * canvas.width;
    this.height = (this.defaultHeight / canvas.defaultHeight) * canvas.height;
    this.target.set(target);
    this.speed = speed;
    this.velocity.set(
      target.subtract(this.position).normalised.multiply(this.speed),
    );
  }

  /**
   * Draw missile.
   * @param {CanvasRenderingContext2D} ctx - canvas context
   * @param {Canvas} canvas
   */
  draw(ctx, canvas) {
    if (this.live) {
      ctx.lineWidth = 2;
      ctx.beginPath();
      ctx.arc(this.position.x, this.position.y, this.width, 0, 2 * Math.PI);
      ctx.fillStyle = `red`;
      ctx.fill();
      ctx.strokeStyle = 'yellow';
      ctx.stroke();
      this.update(canvas);
    }
    this.explosions.forEach((explosion) => explosion.draw(ctx));
  }

  /**
   * Update missile position.
   * @param {Canvas} canvas
   */
  update(canvas) {
    // Add explosion if hits ground
    if (
      this.position.y >= canvas.height - Background.groundHeight &&
      this.explosions.length < 1
    )
      this.explosions.push(new Explosion(this.position));

    // If out of bounds set live to false
    // + explosion size allows time for explosion to finish
    if (
      !(
        this.position.y < 0 ||
        this.position.y > canvas.height + Explosion.defaultSize * 2 ||
        this.position.x < 0 ||
        this.position.x > canvas.width + Explosion.defaultSize * 2
      )
    ) {
      this.position.set(this.position.add(this.velocity));
    } else {
      this.live = false;
    }
  }
}
