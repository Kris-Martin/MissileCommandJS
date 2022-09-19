import Canvas from './canvas.js';
import LoadImages from './load-images.js';
import Background from './background.js';
import Cities from './cities.js';
import Cannon from './cannon/cannon.js';
import Mouse from './mouse.js';
import EnemyController from './enemyController.js';
import Missile from './missile.js';
import City from './city.js';

export const canvas = new Canvas();
const ctx = canvas.context;

let tick = 0;

export const images = new LoadImages();
const background = new Background(canvas.width, canvas.height);
const mouse = new Mouse();
export const cannon = new Cannon(canvas.width, canvas.height);
const cities = new Cities(canvas.width, canvas.height);
const enemy = new EnemyController(canvas.width, canvas.height);

/**
 * Returns true if gameObjectA hits gameObjectB, otherwise false.
 * @param {object} gameObjectA
 * @param {object} gameObjectB
 * @return boolean - return true if hit, false if not
 */
function checkCollision(gameObjectA, gameObjectB) {
  if (
    gameObjectA.position.x + gameObjectA.width > gameObjectB.position.x &&
    gameObjectA.position.x < gameObjectB.position.x + gameObjectB.width &&
    gameObjectA.position.y + gameObjectA.height > gameObjectB.position.y &&
    gameObjectA.position.y < gameObjectB.position.y + gameObjectB.height
  )
    return true;
  return false;
}

/**
 * Check if missile has hit city.
 * @param {Missile} missile
 * @param {City} city
 */
function checkCityCollision(missile, city) {
  if (checkCollision(missile, city) && city.live) {
    console.log('Missile has hit city!');
    missile.live = false;
    // Reduce city health
    if (city.live) city.health -= 20;
    // Update city health display
    document.getElementById(
      city.index.toString(),
    ).innerText = `City ${city.index}: ${city.health}`;
  }
}

/**
 * Check if player missile has hit enemy missile.
 * @param {Missile} playerMissile
 * @param {Missile} enemyMissile
 */
function checkMissileCollision(playerMissile, enemyMissile) {
  if (checkCollision(playerMissile, enemyMissile)) {
    console.log('Enemy missile destroyed!');
    playerMissile.live = false;
    enemyMissile.live = false;
  }
}

function game() {
  // Draw game objects
  background.draw(ctx, tick);
  cities.draw(ctx, tick);
  cannon.draw(ctx, canvas.width, canvas.height);
  enemy.draw(ctx, tick, canvas.width, canvas.height);

  // Check collisions
  cannon.missiles.forEach((playerMissile) => {
    cities.cities.forEach((city) => checkCityCollision(playerMissile, city));
    enemy.missiles.forEach((enemyMissile) =>
      checkMissileCollision(playerMissile, enemyMissile),
    );
  });
  enemy.missiles.forEach((missile) =>
    cities.cities.forEach((city) => checkCityCollision(missile, city)),
  );

  // Check if game is over
  if (cities.cities.filter((city) => city.live).length === 0)
    return window.alert('Game Over!');

  // Update game tick
  tick++;

  // Loop
  window.requestAnimationFrame(game);
}

window.requestAnimationFrame(game);
