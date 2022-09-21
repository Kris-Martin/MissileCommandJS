import Canvas from './canvas.js';
import Missile from './missile.js';
import Vector from './vector.js';

export default class EnemyController {
  startingPos = new Vector();
  target = new Vector();
  missiles = new Array();
  missileSpeed = 1;
  #maxX;
  #startY = 0;
  #targetY;

  /**
   * Creates an enemy with missiles.
   * @param {Canvas} canvas
   * */
  constructor(canvas) {
    this.#maxX = canvas.width;
    this.#targetY = canvas.height;
  }

  /**
   * Generate a missile.
   * @param {Canvas} canvas
   * */
  #generateMissiles(canvas) {
    this.startingPos.set(new Vector(this.#getRandomX(), this.#startY));
    this.target.set(new Vector(this.#getRandomX(), this.#targetY));
    this.missiles.push(
      new Missile(this.startingPos, canvas, this.target, this.missileSpeed),
    );
  }

  #getRandomX() {
    return Math.random() * this.#maxX;
  }

  /**
   * Draw enemy missiles to screen.
   * @param {CanvasRenderingContext2D} ctx
   * @param {number} tick
   * @param {Canvas} canvas
   * */
  draw(ctx, tick, canvas) {
    // Update missiles
    this.update(canvas, tick);
    // Draw the missiles
    if (this.missiles.length > 0)
      this.missiles.forEach((missile) => missile.draw(ctx, canvas));
    // Clean up dead missiles
    this.missiles = this.missiles.filter((missile) => missile.live);
  }

  /**
   * Generate a missile every 300 ticks.
   * @param {Canvas} canvas
   * @param {number} tick
   * */
  update(canvas, tick) {
    if (tick % 300 === 0) {
      this.#generateMissiles(canvas);
    }
    //console.log('length', this.missiles.length);
  }
}
