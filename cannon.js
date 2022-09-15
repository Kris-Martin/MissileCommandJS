import { images, mouseX, mouseY } from './missile-command.js';

export default class Cannon {
  cannonBase = images.cannonBase;
  cannonWheel = images.cannonWheel;
  cannonBarrel = images.cannonBarrel;

  baseWidth = 80;
  baseHeight = 24;
  baseXPos;
  baseYPos;

  wheelWidth = 50;
  wheelHeight = 50;
  wheelXPos;
  wheelYPos;

  barrelWidth = 50;
  barrelHeight = 80;
  barrelXPos;
  barrelYPos;

  reloadWidth = 40;
  reloadHeight = 6;
  reloadPeriod = 128;
  reloadTime = 0;

  constructor(canvasWidth, canvasHeight) {
    this.baseXPos = canvasWidth / 2 - this.baseWidth / 2;
    this.baseYPos = canvasHeight - this.baseHeight;
    this.barrelXPos = canvasWidth / 2 - this.barrelWidth / 2;
    this.barrelYPos = canvasHeight - this.barrelHeight;
    this.wheelXPos = canvasWidth / 2 - this.wheelWidth / 2;
    this.wheelYPos = canvasHeight - this.wheelHeight;
  }

  draw(ctx) {
    ctx.drawImage(
      this.cannonBase,
      this.baseXPos,
      this.baseYPos,
      this.baseWidth,
      this.baseHeight,
    );

    // ctx.translate(this.baseXPos, this.barrelYPos);
    // let vecDiff = this.vectorDiff(this.baseXPos, this.baseYPos, mouseX, mouseY);
    // let angle = this.heading(vecDiff.x, vecDiff.y) - Math.PI / 2;
    // ctx.rotate(angle);
    ctx.drawImage(
      this.cannonBarrel,
      this.barrelXPos,
      this.barrelYPos,
      this.barrelWidth,
      this.barrelHeight,
    );
    // vecDiff = this.vectorDiff(this.baseXPos, this.baseYPos, mouseX, mouseY);
    // angle = -this.heading(vecDiff.x, vecDiff.y) + Math.PI / 2;
    // ctx.rotate(angle);
    // ctx.translate(-this.baseXPos, this.baseYPos);

    ctx.drawImage(
      this.cannonWheel,
      this.wheelXPos,
      this.wheelYPos,
      this.wheelWidth,
      this.wheelHeight,
    );
  }

  vectorDiff(x1, y1, x2, y2) {
    const newX = x1 - x2;
    const newY = y1 - y2;
    return { x: newX, y: newY };
  }

  heading(x, y) {
    const angle = Math.atan2(y, x);
    return angle;
  }
}
