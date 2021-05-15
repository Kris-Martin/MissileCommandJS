/**
 * Purpose: Set/reset all arrays/variables/parameters
 * Args: Null
 * Returns: Null
 */
void setLevel() {
    // Set background frame daytime
    image.backgroundFrame = 4;
    // Should reset all arrays iirc
    player = new Cannon();
    // refresh cities? or persist?
    shells = new ArrayList<Shell>();
    missiles = new ArrayList<Missile>();
    explosions = new ArrayList<Explosion>();
    trails = new ArrayList<Trail>();
    //
    time = 0;
    //
    missileCount = 0;
    missileMax = (int)pow(2, level+2);  //starts at 8, doubles per level
    shellCount += missileMax;
    //
    spawnRate = 256-level*32>32 ? 256-level*32 : 32;  //scale better
    player.reloadPeriod = 128-level*16>16 ? 128-level*16 : 16;  //scale better
}


/**
 * Purpose: Set the starting conditions and create cities
 * Args: Null
 * Returns: Null
 */
void newGame(){
    score = 0;
    shellCount = 16;

    cities = new ArrayList<City>();
    // Create 6 cities
    cities.add(new City((int)(width*1./8)));
    cities.add(new City((int)(width*2./8)));
    cities.add(new City((int)(width*3./8)));
    // Cannon goes in middle, 4/8
    cities.add(new City((int)(width*5./8)));
    cities.add(new City((int)(width*6./8)));
    cities.add(new City((int)(width*7./8)));
}
