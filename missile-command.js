import Canvas from './canvas.js';
import LoadImages from './load-images.js';
import Background from './background.js';
import Cities from './cities.js';
import Cannon from './cannon.js';

const canvas = new Canvas();

const ctx = canvas.context;
export const images = new LoadImages();
const background = new Background();
const cannon = new Cannon(canvas.width, canvas.height, canvas);

let cities = new Cities(canvas.width, canvas.height);
let tick = 0;

let mouseX;
let mouseY;

function getMousePos(e) {
  const bounds = canvas.canvas.getBoundingClientRect();
  mouseX = e.clientX - bounds.left;
  mouseY = e.clientY - bounds.top;
  const angle = cannon.getAngle(mouseX, mouseY);
  console.log(angle);
}

canvas.canvas.addEventListener('mousemove', getMousePos, false);

function game() {
  background.draw(canvas, ctx, tick);
  cities.draw(ctx);
  cannon.draw(ctx);
  tick++;
  window.requestAnimationFrame(game);
}

window.requestAnimationFrame(game);
