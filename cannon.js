import { images } from './missile-command.js';

export default class Cannon {
  cannonBase = images.cannonBase;
  cannonWheel = images.cannonWheel;
  cannonBarrel = images.cannonBarrel;
  angle = 0;

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

  constructor(canvasWidth, canvasHeight, canvas) {
    this.baseXPos = canvasWidth / 2 - this.baseWidth / 2;
    this.baseYPos = canvasHeight - this.baseHeight;
    this.barrelXPos = canvasWidth / 2 - this.barrelWidth / 2;
    this.barrelYPos = canvasHeight - this.barrelHeight;
    this.wheelXPos = canvasWidth / 2 - this.wheelWidth / 2;
    this.wheelYPos = canvasHeight - this.wheelHeight;
  }

  draw(ctx, mouseX, mouseY) {
    // Draw base
    ctx.drawImage(
      this.cannonBase,
      this.baseXPos,
      this.baseYPos,
      this.baseWidth,
      this.baseHeight,
    );

    // Draw barrel
    // https://gamedev.stackexchange.com/questions/67274/is-it-possible-to-rotate-an-image-on-an-html5-canvas-without-rotating-the-whole
    // Save the current coordinate system before changing it
    ctx.save();

    // Move to the middle of where we want to draw our image
    ctx.translate(
      this.barrelXPos + this.barrelWidth / 2,
      this.barrelYPos + this.barrelHeight / 2,
    );

    // Rotate around that point
    ctx.rotate(this.angle);

    // Draw image relative to new origin using width/2 and height/2 as x and y
    ctx.drawImage(
      this.cannonBarrel,
      -this.barrelWidth / 2,
      -this.barrelHeight / 2,
      this.barrelWidth,
      this.barrelHeight,
    );

    // Restore coordinate system to prev saved state
    ctx.restore();

    // Draw wheel
    ctx.drawImage(
      this.cannonWheel,
      this.wheelXPos,
      this.wheelYPos,
      this.wheelWidth,
      this.wheelHeight,
    );
  }

  getAngle(mouseX, mouseY) {
    const vx = mouseX - this.barrelXPos + this.barrelWidth / 2;
    const vy = mouseY - this.barrelYPos + this.barrelHeight / 2;
    // + Math.PI/2 to align top of cannon with mouse pointer
    this.angle = Math.atan2(vy, vx) + Math.PI / 2;
    return this.angle;
  }
}
