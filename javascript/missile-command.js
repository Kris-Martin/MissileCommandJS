import Canvas from './canvas.js';
import LoadImages from './load-images.js';
import Background from './background.js';
import Cities from './cities.js';
import Cannon from './cannon/cannon.js';
import Mouse from './mouse.js';
import EnemyController from '../enemyController.js';

export const canvas = new Canvas();
const ctx = canvas.context;

let tick = 0;

export const images = new LoadImages();
const background = new Background(canvas.width, canvas.height);
const mouse = new Mouse();
export const cannon = new Cannon(canvas.width, canvas.height);
let cities = new Cities(canvas.width, canvas.height);
const enemy = new EnemyController(canvas.width, canvas.height);

function checkCollision(missile, city) {
  if (
    missile.position.x > city.position.x &&
    missile.position.x < city.position.x + city.width &&
    missile.position.y > city.position.y &&
    missile.position.y < city.position.y + city.height &&
    city.live
  ) {
    console.log('Missile has hit target!');
    missile.live = false;
    if (city.live) city.health -= 20;
    console.log(city.health);
  }
}

function game() {
  background.draw(ctx, tick);
  cities.draw(ctx, tick);
  cannon.draw(ctx, canvas.width, canvas.height);
  cannon.missiles.forEach((missile) =>
    cities.cities.forEach((city) => checkCollision(missile, city)),
  );
  enemy.draw(ctx, tick, canvas.width, canvas.height);
  tick++;
  window.requestAnimationFrame(game);
}

window.requestAnimationFrame(game);
