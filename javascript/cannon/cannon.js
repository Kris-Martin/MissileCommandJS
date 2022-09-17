import Missile from '../missile.js';
import Barrel from './barrel.js';
import Base from './base.js';
import Wheel from './wheel.js';
import Vector from '../vector.js';

export default class Cannon {
  base;
  wheel;
  barrel;
  angle = 0;
  missiles = new Array();
  missileSpeed = 4;

  constructor(canvasWidth, canvasHeight) {
    this.base = new Base(canvasWidth, canvasHeight);
    this.wheel = new Wheel(canvasWidth, canvasHeight);
    this.barrel = new Barrel(canvasWidth, canvasHeight);
  }

  /**
   * Draw cannon.
   * @param {CanvasRenderingContext2D} ctx - canvas context
   * @param {number} canvasWidth
   * @param {number} canvasHeight
   */
  draw(ctx, canvasWidth, canvasHeight) {
    // Draw missiles
    this.missiles.forEach((missile) =>
      missile.draw(ctx, canvasWidth, canvasHeight),
    );
    // Clean up dead missiles
    this.missiles = this.missiles.filter((missile) => missile.live);
    // Draw base
    this.base.draw(ctx);
    // Draw barrel
    this.barrel.draw(ctx, this.angle);
    // Draw wheel
    this.wheel.draw(ctx);
  }

  // Set angle to mouse
  setAngle(mouse) {
    const vx = mouse.x - this.barrel.position.x - this.barrel.width / 2;
    const vy = mouse.y - this.barrel.position.y - this.barrel.height / 2;

    // + Math.PI/2 to align top of cannon with mouse pointer
    this.angle = Math.atan2(vy, vx) + Math.PI / 2;
  }

  /**
   * Fire cannon.
   * @param {Vector} target - position to target
   */
  fire(target) {
    this.missiles.push(
      new Missile(this.barrel.midPoint, target, this.missileSpeed),
    );
  }
}
