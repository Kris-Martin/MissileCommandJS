import Canvas from './canvas.js';
import LoadImages from './load-images.js';
import Background from './background.js';
import Cities from './cities.js';
import Cannon from './cannon.js';

const canvas = new Canvas();
const ctx = canvas.context;

let tick = 0;

export const images = new LoadImages();
const background = new Background();
const cannon = new Cannon(canvas.width, canvas.height);
let cities = new Cities(canvas.width, canvas.height);

function getMousePos(e) {
  const bounds = canvas.element.getBoundingClientRect();
  const mouseX = e.clientX - bounds.left;
  const mouseY = e.clientY - bounds.top;
  let clicked = false;
  if (e.type === 'click') {
    console.log('fire!');
    clicked = true;
  }
  cannon.getMousePos(mouseX, mouseY, clicked);
}

canvas.element.addEventListener('mousemove', getMousePos, false);
canvas.element.addEventListener('click', getMousePos, false);

function game() {
  background.draw(canvas, ctx, tick);
  cities.draw(ctx);
  cannon.draw(ctx);
  tick++;
  window.requestAnimationFrame(game);
}

window.requestAnimationFrame(game);
