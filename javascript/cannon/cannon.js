import Missile from '../missile.js';
import Barrel from './barrel.js';
import Base from './base.js';
import Wheel from './wheel.js';
import Vector from '../vector.js';
import Canvas from '../canvas.js';

export default class Cannon {
  base;
  wheel;
  barrel;
  angle = 0;
  missiles = new Array();
  missileSpeed = 4;

  /**
   * Create cannon
   * @param {Canvas} canvas
   */
  constructor(canvas) {
    this.base = new Base(canvas);
    this.wheel = new Wheel(canvas);
    this.barrel = new Barrel(canvas);
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

  /**
   * Set barrel alignment angle based on position of mouse.
   * @param {Vector} mousePosition - position of mouse
   */
  setAngle(mousePosition) {
    this.angle =
      mousePosition.subtract(this.barrel.midPoint).theta + Math.PI / 2;
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
