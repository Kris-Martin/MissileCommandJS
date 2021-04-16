/*
Purpose: ?
Arguments: Null
Returns: Null
*/
void displayGame(){
  levelBackground(level);
  for (city c : cities){
    c.display();
  }
  for (missile m : missiles){
    m.display();
  }
  for (shell s : shells){
    s.display();
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
  background(16,16,64);
  //image(background1,0,0,width,height);  //laggy, too high res for repeat draw
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
  rect(5,5,textWidth(text)+textWidth("   "),28,6);
  fill(60,180,120);
  textSize(20);
  text(text,15,26);
}
