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
import { Settings } from './settings.js';

function gameInit() {
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

  const playBtn = createControls(canvas, mouse, cannon);

  return {
    explosions,
    canvas,
    score,
    tick,
    hour,
    day,
    cities,
    gameRunning,
    playBtn,
    background,
    ctx,
    enemy,
    cannon,
  };
}

function createControls(canvas, mouse, cannon) {
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
  return playBtn;
}

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
    gameState.explosions.push(
      new Explosion(missile.position, gameState.canvas),
    );
    console.log('Missile has hit city!');
    missile.live = false;
    // Reduce city health
    if (city.live)
      city.health =
        city.health >= Settings.missileDamage
          ? city.health - Settings.missileDamage
          : 0;
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
    gameState.explosions.push(
      new Explosion(playerMissile.position, gameState.canvas),
    );
    // Log hit to console
    console.log('Enemy missile destroyed!');
    // Score based on height of enemy missile - higher score closer to ground
    gameState.score += Settings.calcScore(
      enemyMissile.position.y,
      gameState.canvas.height,
    );
    // Update score display
    document.getElementById('score').innerText = `Score: ${gameState.score}`;
    // Update missile status
    playerMissile.live = false;
    enemyMissile.live = false;
  }
}

function updateGameClock() {
  if (
    gameState.tick % Settings.ticksPerHour === 0 &&
    gameState.tick !== 0 &&
    gameState.hour !== 25
  )
    document.getElementById('hour').innerText = ` :: Hour: ${++gameState.hour}`;
  if (gameState.hour === 24) {
    gameState.hour = 0;
    document.getElementById('hour').innerText = ` :: Hour: ${gameState.hour}`;
    document.getElementById('day').innerText = `Day: ${++gameState.day}`;
  }
}

// Check if game is over and leave time for explosion to finish
// and city rubble to appear
function checkGameOver() {
  if (
    (gameState.cities.collection.filter((city) => city.live).length === 0 ||
      !gameState.gameRunning) &&
    gameState.tick % (Explosion.currentSize * 2) === 0
  ) {
    return true;
  }
  return false;
}

function startGame() {
  gameState.gameRunning = true;
  gameState.playBtn.disabled = true;
  window.requestAnimationFrame(game);
}

function pauseGame() {
  window.alert('Game paused. Click ok to return to game.');
}

function stopGame() {
  gameState.gameRunning = false;
}

function reloadGame() {
  location.reload();
}

function game() {
  // Track survival time
  updateGameClock();

  // Draw game objects
  gameState.background.draw(gameState.ctx, gameState.tick);
  gameState.enemy.draw(gameState.ctx, gameState.tick, gameState.canvas);
  gameState.explosions.forEach((explosion) => explosion.draw(gameState.ctx));
  gameState.background.ground.draw(gameState.ctx);
  gameState.cannon.draw(gameState.ctx, gameState.canvas);
  gameState.cities.draw(gameState.ctx, gameState.tick);

  // Clean up dead explosions
  gameState.explosions = gameState.explosions.filter(
    (explosion) => explosion.live,
  );

  // Check collisions between all missiles and cities
  gameState.cannon.missiles
    .concat(gameState.enemy.missiles)
    .forEach((missile) => {
      gameState.cities.collection.forEach((city) =>
        checkCityCollision(missile, city),
      );
    });

  // Check collisions between player missiles and enemy missiles
  gameState.cannon.missiles.forEach((playerMissile) => {
    gameState.enemy.missiles.forEach((enemyMissile) =>
      checkMissileCollision(playerMissile, enemyMissile),
    );
  });

  // Check if game is over and display end game message
  if (checkGameOver()) {
    return window.alert(
      `Game over. You survived ${gameState.day} day${
        gameState.day === 1 ? '' : 's'
      } and ${gameState.hour} hour${
        gameState.hour === 1 ? '' : 's'
      }. Your final score was: ${gameState.score}.`,
    );
  }

  // Update game tick
  gameState.tick++;

  // Loop
  window.requestAnimationFrame(game);
}

export const images = new LoadImages();
const gameState = gameInit();
