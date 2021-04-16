/*
Purpose: ?
 Arguments: Null
 Returns: Null
 */
void processGame() {
  time++;  //make better XD
  
  //city loop
  for (int i=0; i<cities.size(); i++) {
    City c = cities.get(i);
    c.process();
  }
  
  //missile loop
  for (int i=0; i<missiles.size(); i++) {
    Missile m = missiles.get(i);
    m.process();
  }
  
  //shell loop
  for (int i=0; i<shells.size(); i++) {
    Shell s = shells.get(i);
    if(!s.exist){
      shells.remove(s);
    }
    s.process();
  }
  
  //other
  processCursor();
  player.reloadAndShoot();
  spawnMissiles();
}

/*
Purpose: To add the missiles to the array 
 Arguments: Null
 Returns: Null
 */


//int lastMillis=0;


/*
Purpose: ?
 Arguments: Null
 Returns: Null
 */
void processCursor() {
  mousePos.x = mouseX;
  mousePos.y = mouseY;
}

  void spawnMissiles() {
    if (time % 64 == 0){
    missiles.add(new Missile());
    }
    
 
  }

/*
Purpose:  Calculates a vector between two vectors
 Args:  Vectors a & b
 Returns:  difference vector
 */
PVector vectorDiff(PVector a, PVector b) {
  return new PVector(a.x-b.x, a.y-b.y);
}
