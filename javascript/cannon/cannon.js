import Barrel from './barrel.js';
import Base from './base.js';
import Wheel from './wheel.js';

export default class Cannon {
  base;
  wheel;
  barrel;

  angle = 0;
  mouseX;
  mouseY;

  constructor(canvasWidth, canvasHeight) {
    this.canvasWidth = canvasWidth;
    this.canvasHeight = canvasHeight;

    this.base = new Base(canvasWidth, canvasHeight);
    this.wheel = new Wheel(canvasWidth, canvasHeight);
    this.barrel = new Barrel(canvasWidth, canvasHeight);
  }

  draw(ctx, mouseX, mouseY) {
    // Draw base
    this.base.draw(ctx);

    // Draw barrel
    this.barrel.draw(ctx, this.angle);
    // Draw wheel
    this.wheel.draw(ctx);
  }

  // Calculate and store current pos and angle of mouse
  setMousePos(mouseX, mouseY, clicked) {
    this.mouseX = mouseX;
    this.mouseY = mouseY;
    this.clicked = clicked;

    const vx = this.mouseX - this.barrel.position.x + this.barrel.width / 2;
    const vy = this.mouseY - this.barrel.position.y + this.barrel.height / 2;

    // + Math.PI/2 to align top of cannon with mouse pointer
    this.angle = Math.atan2(vy, vx) + Math.PI / 2;
  }
}
