import Canvas from './canvas.js';
import LoadImages from './load-images.js';
import Background from './background.js';
import Cities from './cities.js';
import Cannon from './cannon/cannon.js';
import Mouse from './mouse.js';
import EnemyController from './enemyController.js';
import Missile from './missile.js';

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
    missile.position.x + missile.width > city.position.x &&
    missile.position.x < city.position.x + city.width &&
    missile.position.y + missile.height > city.position.y &&
    missile.position.y < city.position.y + city.height &&
    city.live
  ) {
    console.log('Missile has hit city!');
    missile.live = false;
    if (city.live) city.health -= 20;
    console.log(city.health);
  }
}

function checkMissileCollision(playerMissile, enemyMissile) {
  if (
    playerMissile.position.x + playerMissile.width > enemyMissile.position.x &&
    playerMissile.position.x < enemyMissile.position.x + enemyMissile.width &&
    playerMissile.position.y + playerMissile.height > enemyMissile.position.y &&
    playerMissile.position.y < enemyMissile.position.y + enemyMissile.height
  ) {
    console.log('Enemy missile destroyed!');
    playerMissile.live = false;
    enemyMissile.live = false;
  }
}

function game() {
  background.draw(ctx, tick);
  cities.draw(ctx, tick);
  cannon.draw(ctx, canvas.width, canvas.height);
  enemy.draw(ctx, tick, canvas.width, canvas.height);
  cannon.missiles.forEach((missile) =>
    cities.cities.forEach((city) => checkCollision(missile, city)),
  );
  enemy.missiles.forEach((missile) =>
    cities.cities.forEach((city) => checkCollision(missile, city)),
  );
  cannon.missiles.forEach((playerMissile) =>
    enemy.missiles.forEach((enemyMissile) =>
      checkMissileCollision(playerMissile, enemyMissile),
    ),
  );
  tick++;
  window.requestAnimationFrame(game);
}

window.requestAnimationFrame(game);
