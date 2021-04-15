/*
Purpose: ?
Arguments: Null
Returns: Null
*/
void processGame(){
  for (city c : cities){
    c.process();
  }
  for (missile m : missiles){
    m.process();
  }
  for (shell s : shells){
    s.process();
  }
  processCursor();
  player.reloadAndShoot();
}



/*
Purpose: ?
Arguments: Null
Returns: Null
*/
void processCursor(){
  mousePos.x = mouseX;
  mousePos.y = mouseY;
}


/*
Purpose:  Calculates a vector between two vectors
Args:  Vectors a & b
Returns:  difference vector
*/
PVector vectorDiff(PVector a, PVector b){
  return new PVector(a.x-b.x,a.y-b.y);
}
