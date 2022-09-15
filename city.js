import { images } from './missile-command.js';
export default class City {
  city = images.city;
  cityRubble = images.cityRubble;
  cityOnFire = images.cityOnFire;
  frame = 0;

  healthMax = 256;
  health = this.healthMax;
  isAlive = true;

  width = 80;
  height = 40;

  // Value needed to adjust position of rubble inline with city.
  rubblePosY = 5;

  xPos;
  yPos;

  constructor(xPos, yPos) {
    this.xPos = xPos - this.width / 2;
    this.yPos = yPos - this.height - 5; // height - ground height/3
  }

  draw(ctx) {
    if (!this.isAlive) {
      this.yPos += this.rubblePosY;
    }
    ctx.drawImage(this.city, this.xPos, this.yPos, this.width, this.height);
  }
}
