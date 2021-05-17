/**
 * Purpose: Main processing loop of game
 * Args: Null
 * Returns: Null
 */
void processGame() {
    // Time in the level
    time++;

    // Total health of all cities, used to caclulate fail state
    int Health = 0;

    // Trail loop
    for (int i=0; i<trails.size(); i++) {
        Trail t = trails.get(i);
        t.process();
        if (!t.exist) {
            trails.remove(t);
        }
    }

    // City loop
    for (int i=0; i<cities.size(); i++) {
        City c = cities.get(i);
        c.process();
        Health+= c.health;
    }

    // Missile loop
    for (int i=0; i<missiles.size(); i++) {
        Missile m = missiles.get(i);
        m.process();
        if (!m.exist) {
            missiles.remove(m);
        }
    }

    // Shell loop
    for (int i=0; i<shells.size(); i++) {
        Shell s = shells.get(i);
        s.process();
        if (!s.exist) {
            shells.remove(s);
        }
    }

    // Missile loop
    for (int i=0; i<explosions.size(); i++) {
        Explosion e = explosions.get(i);
        e.process();
        if (!e.exist) {
            explosions.remove(e);
        }
    }

    // total city health and game over check
    if (Health<=0) {
        gameState = -1;
    }

    // Other
    processCursor();
    player.reloadAndShoot();
    spawnMissiles();
}


/**
 * Purpose: To add the missiles to the array
 * Args: Null
 * Returns: Null
 */
void spawnMissiles() {
    if (time % spawnRate == 0 && missileCount<missileMax) {
        missiles.add(new Missile());
        missileCount++;
    }
    if (missileCount==missileMax && missiles.size()==0 && explosions.size()==0) {
        gameState = 10;
    }
}


/**
 * Purpose: Transfers inbuilt mouse variables to single PVector for ease of use.
 * Args: Null
 * Returns: Null
 */
void processCursor() {
    mousePos.x = mouseX;
    mousePos.y = mouseY;
}


/**
 * Purpose: Toggle pause menu.
 * Args: Null
 * Returns: Null
 */
void keyPressed() {
    if (key == ' ') {
        if (gameState == 1) {
            gameState = 3;
        }
        else if (gameState == 3) {
            gameState = 1;
        }
    }
}


/**
 * Purpose:  Calculates a vector between two vectors.
 * Args:  Vectors a & b
 * Returns:  difference vector
 */
PVector vectorDiff(PVector a, PVector b) {
    return new PVector(a.x-b.x, a.y-b.y);
}
