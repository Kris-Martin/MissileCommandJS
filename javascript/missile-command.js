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
export const images = new LoadImages();
export const cannon = new Cannon(canvas.width, canvas.height);
const ctx = canvas.context;
const background = new Background(canvas.width, canvas.height);
const cities = new Cities(canvas.width, canvas.height);
const mouse = new Mouse();
const enemy = new EnemyController(canvas.width, canvas.height);

let tick = 0;
let score = 0;
let day = 0;
let hour = 0;
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
    if (city.live) city.health = city.health >= 20 ? city.health - 20 : 0;
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
    // Score based on height of enemy missile - higher score closer to ground
    score += Math.floor(
      Math.pow(enemyMissile.position.y / canvas.height, 2) * 250,
    );
    // Update score display
    document.getElementById('score').innerText = `Score: ${score}`;
    playerMissile.live = false;
    enemyMissile.live = false;
  }
}

function updateGameClock() {
  if (tick % 1200 === 0 && tick !== 0 && hour !== 25)
    document.getElementById('hour').innerText = ` :: Hour: ${++hour}`;
  if (hour === 24) {
    hour = 0;
    document.getElementById('hour').innerText = ` :: Hour: ${hour}`;
    document.getElementById('day').innerText = `Day: ${++day}`;
  }
}

function game() {
  // Track survival time
  updateGameClock();

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

  // Check if game is over and leave time for city rubble to appear
  if (
    cities.cities.filter((city) => city.live).length === 0 &&
    tick % 20 === 0
  ) {
    return window.alert(
      `Game over. You survived ${day} day${
        day === 1 ? '' : 's'
      } and ${hour} hour${
        hour === 1 ? '' : 's'
      }. Your final score was: ${score}.`,
    );
  }

  // Update game tick
  tick++;

  // Loop
  window.requestAnimationFrame(game);
}

// function startGame() {
//   if (window.confirm('Start game?')) window.requestAnimationFrame(game);
// }

// startGame();
window.requestAnimationFrame(game);
