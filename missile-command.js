import Canvas from './canvas.js';
import Background from './background.js';
import Cities from './cities.js';
import LoadImages from './load-images.js';

const canvas = new Canvas();
const ctx = canvas.context;
export const images = new LoadImages();
const background = new Background();

let cities = new Cities(canvas.width, canvas.height);
let tick = 0;

function game() {
  background.draw(canvas, ctx, tick);
  cities.draw(ctx);
  tick++;
  window.requestAnimationFrame(game);
}

window.requestAnimationFrame(game);
