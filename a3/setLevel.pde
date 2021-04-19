/*
Purpose: set/reset all arrays/variables/parameters
Arguments: Null
Returns: Null
*/
void setLevel(){
  //should reset all arrays iirc
  player = new Cannon();
  cities = new ArrayList<City>();  //refresh cities? or persist due to health?
  shells = new ArrayList<Shell>();
  missiles = new ArrayList<Missile>();
  explosions = new ArrayList<Explosion>();
  trails = new ArrayList<Trail>();
  
  //create 6 cities
  cities.add(new City((int)(width*1./8)));
  cities.add(new City((int)(width*2./8)));
  cities.add(new City((int)(width*3./8)));
  //cannon goes in middle, 4/8
  cities.add(new City((int)(width*5./8)));
  cities.add(new City((int)(width*6./8)));
  cities.add(new City((int)(width*7./8)));
  
  //
  time = 0;
  score = 0;
  points = 0;
  //
  shellCount = 16*level;
  missileCount = 0;
  missileMax = (int)pow(2,level+2);  //starts at 16, doubles per level
  //
  spawnRate = 256-level*32>32 ? 256-level*32 : 32;  //scale better
  player.reloadPeriod = 128-level*16>16 ? 128-level*16 : 16;  //scale better
  
  //temp value
  arcadeHealth+=level;
}
