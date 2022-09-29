export const Settings = {
  missileDamage: 20,
  ticksPerHour: 1200, // ticks per game hour
  playerMissileSpeed: 4,
  enemyMissileSpeed: 1,
  enemyFireRate: 300, // ticks per missile - 4 missiles/game hour
  cityHealth: 256,
  // Score based on height of enemy missile - higher score closer to ground
  calcScore: (missilePosY, canvasHeight) => {
    return Math.floor(Math.pow(missilePosY / canvasHeight, 2) * 250);
  },
};
