import { images } from './missile-command.js';
import Vector from './vector.js';
export default class City {
  city = images.city;
  cityRubble = images.cityRubble;
  cityOnFire = images.cityOnFire;
  frame = 0;

  healthMax = 256;
  health = this.healthMax;
  live = true;

  width = 80;
  height = 40;

  // Value needed to adjust position of rubble inline with city.
  rubblePosY = 5;
  groundPlacement = 5;

  position = new Vector();

  /**
   * Creates a city.
   * @param {Vector} position
   * */
  constructor(position) {
    this.position.x = position.x - this.width / 2;
    this.position.y = position.y - this.height - this.groundPlacement;
  }

  /**
   * Draw city.
   * @param {CanvasRenderingContext2D} ctx - canvas context
   */
  draw(ctx, tick) {
    ctx.drawImage(
      this.city,
      this.position.x,
      this.position.y,
      this.width,
      this.height,
    );
    this.update(tick);
  }

  update(tick) {
    // City burns before turning to rubble when health reaches 0.
    if (this.health < 1 && this.live) {
      this.city = this.cityRubble;
      // Used to align position of rubble inline with city.
      this.position.y += this.rubblePosY;
      this.live = false;
      // If health is less than healthMax shows city flashing on fire.
    } else if (this.health < this.healthMax && this.health > 0) {
      // Increment frame every 10 ticks.
      if (tick % 10 === 0) {
        this.frame++;
      }
      // Reset to frame to 0 when end of Array reached.
      if (this.frame >= this.cityOnFire.length) {
        this.frame = 0;
      }
      this.city = this.cityOnFire[this.frame];
    }
  }
}
