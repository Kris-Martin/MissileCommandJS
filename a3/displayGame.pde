/*
Purpose: ?
Arguments: Null
Returns: Null
*/
void displayGame(){
  levelBackground(level);
  displayScore();
  displayCannon();
  for (city c : cities){
    c.display();
  }
  for (missile m : missiles){
    m.display();
  }
  for (shell s : shells){
    s.display();
  }
}



/*
Purpose: Displays level background
Arguments: Current level
Returns: Null
*/
void levelBackground(int level){
  //change this
  background(16,16,64);
}



/*
Purpose: Displays score
Arguments: Null
Returns: Null
*/
void displayCannon(){
  //change this
  stroke(0);
  strokeWeight(2);
  fill(64,64,128);
  rect((width*1/2)-cannonDim.x/2,height-cannonDim.y,cannonDim.x,cannonDim.y);
}



/*
Purpose: Displays score
Arguments: Null
Returns: Null
*/
void displayScore(){
  //change this
  stroke(0);
  strokeWeight(2);
  fill(50);
  rect(5,5,84,28);
  fill(200);
  textSize(20);
  text(score,10,26);
}
