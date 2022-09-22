import Background from './background.js';
import Cannon from './cannon/cannon.js';
import Canvas from './canvas.js';
import Cities from './cities.js';
import City from './city.js';
import EnemyController from './enemyController.js';
import Explosion from './explosion.js';
import LoadImages from './load-images.js';
import Missile from './missile.js';
import Mouse from './mouse.js';

export const images = new LoadImages();

const canvas = new Canvas();
const ctx = canvas.context;
const background = new Background(canvas);
const cities = new Cities(canvas);
const cannon = new Cannon(canvas);
const mouse = new Mouse();
const enemy = new EnemyController(canvas);

let gameRunning = false;
let explosions = new Array();
let tick = 0;
let score = 0;
let day = 0;
let hour = 0;

const playBtn = document.getElementById('play');
const pauseBtn = document.getElementById('pause');
const stopBtn = document.getElementById('stop');
const reloadBtn = document.getElementById('reload');

playBtn.addEventListener('click', startGame);
pauseBtn.addEventListener('click', pauseGame);
stopBtn.addEventListener('click', stopGame);
reloadBtn.addEventListener('click', reloadGame);
canvas.element.addEventListener(
  'mousemove',
  (e) => {
    mouse.setPosition(e, canvas);
    cannon.setAngle(mouse.position);
  },
  false,
);
canvas.element.addEventListener(
  'click',
  (e) => {
    cannon.fire(mouse.position);
  },
  false,
);

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
    // Add explosion at location of hit
    explosions.push(new Explosion(missile.position, canvas));
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
    // Add explosion at location of hit
    explosions.push(new Explosion(playerMissile.position, canvas));
    // Log hit to console
    console.log('Enemy missile destroyed!');
    // Score based on height of enemy missile - higher score closer to ground
    score += Math.floor(
      Math.pow(enemyMissile.position.y / canvas.height, 2) * 250,
    );
    // Update score display
    document.getElementById('score').innerText = `Score: ${score}`;
    // Update missile status
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

// Check if game is over and leave time for city rubble to appear
function checkGameOver() {
  if (
    (cities.cities.filter((city) => city.live).length === 0 || !gameRunning) &&
    tick % 20 === 0
  ) {
    return true;
  }
}

function startGame() {
  gameRunning = true;
  playBtn.disabled = true;
  window.requestAnimationFrame(game);
}

function pauseGame() {
  window.alert('Game paused. Click ok to return to game.');
}

function stopGame() {
  gameRunning = false;
}

function reloadGame() {
  location.reload();
}

function game() {
  // Track survival time
  updateGameClock();

  // Draw game objects
  background.draw(ctx, tick);
  enemy.draw(ctx, tick, canvas);
  explosions.forEach((explosion) => explosion.draw(ctx));
  background.ground.draw(ctx);
  cannon.draw(ctx, canvas);
  cities.draw(ctx, tick);

  // Clean up dead explosions
  explosions = explosions.filter((explosion) => explosion.live);

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

  // Check if game is over and display end game message
  if (checkGameOver()) {
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
