/*
Purpose: ?
Arguments: Null
Returns: Null
*/
void displayGame(){
  levelBackground(level);
  for (City c : cities){
    c.display();
  }
  for (Missile m : missiles){
    m.display();
  }
  for (Shell s : shells){
    s.display();
  }
  for (Explosion e : explosions){
    e.display();
  }
  //display mouse crossHair, seperated so shells can have crosshairs too
  player.display();
  displayCrossHair(mousePos,cursorSize,60,180,180);
  displayScore();
}



/*
Purpose: Displays level background
Arguments: Current level
Returns: Null
*/
void levelBackground(int level){
  //change this
  switch(level){
    case 1:
      image(background1,0,0);  //laggy, too high res for repeat draw
      break;
    default:
      background(level*32);
      break;
  }
}



/*
Purpose: Displays CrossHair
Arguments: Current level
Returns: Null
*/
void displayCrossHair(PVector pos, int size,int r, int g, int b){
  stroke(r,g,b);
  int gap = size/2;
  line(pos.x+gap,pos.y,pos.x+size+gap,pos.y);
  line(pos.x-gap,pos.y,pos.x-size-gap,pos.y);
  line(pos.x,pos.y+gap,pos.x,pos.y+size+gap);
  line(pos.x,pos.y-gap,pos.x,pos.y-size-gap);
}



/*
Purpose: Displays score
Arguments: Null
Returns: Null
*/
void displayScore(){
  //change this
  String text = "Score: "+score;
  stroke(0);
  strokeWeight(2);
  fill(50);
  rect(5,5,width-10,28,6);
  
  fill(60,180,120);
  textSize(20);
  text(text,15,26);
}
