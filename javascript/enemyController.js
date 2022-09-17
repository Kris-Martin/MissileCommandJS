import Missile from './missile.js';
import Vector from './vector.js';

export default class EnemyController {
  startingPos = new Vector();
  target = new Vector();
  missiles = new Array();
  missileSpeed = 1;
  maxX;
  startY = 0;
  targetY;

  /**
   * Creates an enemy with missiles.
   * @param {number} canvasWidth
   * */
  constructor(canvasWidth, canvasHeight) {
    this.maxX = canvasWidth;
    this.targetY = canvasHeight;
  }

  generateMissiles() {
    this.startingPos.set(new Vector(this.getRandomX(), 0));
    this.target.set(new Vector(this.getRandomX(), this.targetY));
    this.missiles.push(
      new Missile(this.startingPos, this.target, this.missileSpeed),
    );
  }

  getRandomX() {
    return Math.random() * this.maxX;
  }

  draw(ctx, tick, canvasWidth, canvasHeight) {
    this.update(tick);
    // Draw the missiles
    if (this.missiles.length > 0)
      this.missiles.forEach((missile) =>
        missile.draw(ctx, canvasWidth, canvasHeight),
      );
    // Clean up dead missiles
    this.missiles = this.missiles.filter((missile) => missile.live);
  }

  update(tick) {
    if (tick % 300 === 0) {
      this.generateMissiles();
    }
    //console.log('length', this.missiles.length);
  }
}
