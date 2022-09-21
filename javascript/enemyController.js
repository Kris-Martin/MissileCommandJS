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

  #generateMissiles() {
    this.startingPos.set(new Vector(this.#getRandomX(), this.#startY));
    this.target.set(new Vector(this.#getRandomX(), this.#targetY));
    this.missiles.push(
      new Missile(this.startingPos, this.target, this.missileSpeed),
    );
  }

  #getRandomX() {
    return Math.random() * this.#maxX;
  }

  /**
   * Draw enemy missiles to screen.
   * @param {CanvasRenderingContext2D} ctx
   * @param {number} tick
   * @param {number} canvas
   * */
  draw(ctx, tick, canvas) {
    this.update(tick);
    // Draw the missiles
    if (this.missiles.length > 0)
      this.missiles.forEach((missile) => missile.draw(ctx, canvas));
    // Clean up dead missiles
    this.missiles = this.missiles.filter((missile) => missile.live);
  }

  /**
   * Generate a missile every 300 ticks.
   * @param {number} tick
   * */
  update(tick) {
    if (tick % 300 === 0) {
      this.#generateMissiles();
    }
    //console.log('length', this.missiles.length);
  }
}
