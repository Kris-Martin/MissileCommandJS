import Canvas from './canvas.js';
import LoadImages from './load-images.js';
import Background from './background.js';
import Cities from './cities.js';
import Cannon from './cannon/cannon.js';
import Mouse from './mouse.js';

export const canvas = new Canvas();
const ctx = canvas.context;

let tick = 0;

export const images = new LoadImages();
const background = new Background(canvas.width, canvas.height);
const mouse = new Mouse();
export const cannon = new Cannon(canvas.width, canvas.height);
let cities = new Cities(canvas.width, canvas.height);

function game() {
  background.draw(ctx, tick);
  cities.draw(ctx);
  cannon.draw(ctx, canvas.width, canvas.height);
  tick++;
  window.requestAnimationFrame(game);
}

window.requestAnimationFrame(game);
