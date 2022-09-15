import { images } from './missile-command.js';

export default class Cannon {
  cannonBase = images.cannonBase;
  cannonWheel = images.cannonWheel;
  cannonBarrel = images.cannonBarrel;

  baseWidth = 80;
  baseHeight = 24;
  baseXPos;
  baseYPos;

  wheelWidth = 40;
  wheelHeight = 40;

  barrelWidth = 40;
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
    this.barrelXPos = this.baseXPos;
    this.barrelYPos = canvasHeight - this.baseHeight / 2;
  }

  draw(ctx) {
    ctx.drawImage(
      this.cannonBase,
      this.baseXPos,
      this.baseYPos,
      this.baseWidth,
      this.barrelHeight,
    );
  }
}
