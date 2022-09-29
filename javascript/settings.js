export const Settings = {
  missileDamage: 64,
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

// Settings from original project
// Starts at 8, doubles per level
// missileMax = (int)pow(2, level+2);
// shellCount = 8;
// Player starts level 1 with 16 missiles
// From level 2 has missileMax + any unused missiles from prev level
// shellCount += missileMax;
// Enemy missile and player missile rate management
// spawnRate = 256-level*32>32 ? 256-level*32 : 32;
// player.reloadPeriod = 128-level*16>16 ? 128-level*16 : 16;
// Increase level when missileCount==missileMax && missiles.size()==0 && explosions.size()==0
