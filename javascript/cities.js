import City from './city.js';

export default class Cities {
  cities = new Array(6);

  constructor(canvasWidth, canvasHeight) {
    this.create(canvasWidth, canvasHeight);
  }

  create(canvasWidth, canvasHeight) {
    for (let i = 0; i < this.cities.length; i++) {
      // Leave space in the middle for the cannon
      let pos = i < 3 ? i + 1 : i + 2;
      const city = new City((canvasWidth * pos) / 8, canvasHeight);
      this.cities[i] = city;
    }
  }

  draw(ctx) {
    for (let i = 0; i < this.cities.length; i++) {
      this.cities[i].draw(ctx);
    }
  }
}
