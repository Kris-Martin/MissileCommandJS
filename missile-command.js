import { Canvas } from './canvas.js';
import { Background } from './background.js';

const canvas = new Canvas();
const ctx = canvas.context;
const background = new Background();
let tick = 0;

function game() {
  background.draw(canvas, ctx, tick);
  tick++;
  window.requestAnimationFrame(game);
}

window.requestAnimationFrame(game);
