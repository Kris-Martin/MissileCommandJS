import City from './city.js';
import Vector from './vector.js';

export default class Cities {
  collection = new Array(6);

  /**
   * Creates cities
   * @param {Canvas} canvas
   */
  constructor(canvas) {
    this.create(canvas);
  }

  /**
   * Creates cities
   * @param {Canvas} canvas
   */
  create(canvas) {
    for (let i = 0; i < this.collection.length; i++) {
      // Leave space in the middle for the cannon
      let pos = i < 3 ? i + 1 : i + 2;
      const city = new City(
        i + 1,
        new Vector((canvas.width * pos) / 8, canvas.height),
        canvas,
      );
      this.collection[i] = city;
    }
  }

  /**
   * Draw cities.
   * @param {CanvasRenderingContext2D} ctx - canvas context
   */
  draw(ctx, tick) {
    for (let i = 0; i < this.collection.length; i++) {
      this.collection[i].draw(ctx, tick);
    }
  }
}
