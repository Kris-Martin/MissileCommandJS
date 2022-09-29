import Canvas from '../canvas.js';
import Missile from '../missile.js';
import Vector from '../vector.js';
import Barrel from './barrel.js';
import Base from './base.js';
import Wheel from './wheel.js';
import { Settings } from '../settings.js';

export default class Cannon {
  canvas;
  base;
  wheel;
  barrel;
  angle = 0;
  missiles = new Array();
  defaultMissileSpeed = Settings.playerMissileSpeed;
  missileSpeed = this.defaultMissileSpeed;

  /**
   * Create cannon
   * @param {Canvas} canvas
   */
  constructor(canvas) {
    this.canvas = canvas;
    this.base = new Base(canvas);
    this.wheel = new Wheel(canvas);
    this.barrel = new Barrel(canvas);
    this.missileSpeed =
      (this.defaultMissileSpeed / canvas.defaultHeight) * canvas.height;
    console.log('Player missile speed: ', this.missileSpeed);
  }

  /**
   * Draw cannon.
   * @param {CanvasRenderingContext2D} ctx - canvas context
   * @param {Canvas} canvas
   */
  draw(ctx, canvas) {
    // Draw missiles
    this.missiles.forEach((missile) => missile.draw(ctx, canvas));
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
   * @param {Canvas} canvas
   */
  fire(target) {
    this.missiles.push(
      new Missile(this.barrel.midPoint, this.canvas, target, this.missileSpeed),
    );
  }
}
