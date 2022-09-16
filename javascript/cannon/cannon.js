import Barrel from './barrel.js';
import Base from './base.js';
import Wheel from './wheel.js';

export default class Cannon {
  base;
  wheel;
  barrel;

  constructor(canvasWidth, canvasHeight) {
    this.base = new Base(canvasWidth, canvasHeight);
    this.wheel = new Wheel(canvasWidth, canvasHeight);
    this.barrel = new Barrel(canvasWidth, canvasHeight);
  }

  draw(ctx) {
    // Draw base
    this.base.draw(ctx);
    // Draw barrel
    this.barrel.draw(ctx, this.angle);
    // Draw wheel
    this.wheel.draw(ctx);
  }

  // Set angle to mouse
  setAngle(mouseX, mouseY) {
    const vx = mouseX - this.barrel.position.x + this.barrel.width / 2;
    const vy = mouseY - this.barrel.position.y + this.barrel.height / 2;

    // + Math.PI/2 to align top of cannon with mouse pointer
    this.angle = Math.atan2(vy, vx) + Math.PI / 2;
  }
}
