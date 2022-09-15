import Canvas from './canvas.js';
import Background from './background.js';
import Cities from './cities.js';
import City from './city.js';

const canvas = new Canvas();
const ctx = canvas.context;
const background = new Background();
// const city = new City((canvas.width * 1) / 8, canvas.height);
let cities = new Cities(canvas.width, canvas.height);
let tick = 0;

function game() {
  background.draw(canvas, ctx, tick);
  cities.draw(ctx);
  tick++;
  window.requestAnimationFrame(game);
}

window.requestAnimationFrame(game);
