/*
Purpose: set/reset all arrays/variables/parameters
Arguments: Null
Returns: Null
*/
void setLevel(){
  //should reset all arrays iirc
  player = new cannon();
  cities = new ArrayList<city>();
  shells = new ArrayList<shell>();
  missiles = new ArrayList<missile>();
  
  //create 6 cities
  cities.add(new city((int)(width*1./8.)));
  cities.add(new city((int)(width*2./8.)));
  cities.add(new city((int)(width*3./8.)));
  //cannon goes in middle, 4/8
  cities.add(new city((int)(width*5/8)));
  cities.add(new city((int)(width*6/8)));
  cities.add(new city((int)(width*7/8)));
}
