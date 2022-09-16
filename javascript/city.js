import { images } from './missile-command.js';
import Vector from './vector.js';
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
  groundHeight = 5;

  position = new Vector();

  /**
   * Creates a city.
   * @param {Vector} position
   * */
  constructor(position) {
    this.position.x = position.x - this.width / 2;
    this.position.y = position.y - this.height - this.groundHeight;
  }

  draw(ctx) {
    if (!this.isAlive) {
      this.position.y += this.rubblePosY;
    }
    ctx.drawImage(
      this.city,
      this.position.x,
      this.position.y,
      this.width,
      this.height,
    );
  }
}
