/*
Purpose: set/reset all arrays/variables/parameters
Arguments: Null
Returns: Null
*/
void setLevel(){
  //should reset all arrays iirc
  player = new Cannon();
  cities = new ArrayList<City>();
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
}
