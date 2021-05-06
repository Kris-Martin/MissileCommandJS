/**
 * Purpose: basically upgrades menu
 * Arguments: Null
 * Returns: Null
 */
void displayGameMenu() {
  MenuButton nextLevel = new MenuButton("click here start next level", width/2, height/3);
  nextLevel.secondaryDisplay();
  if (nextLevel.pressed()){
    level ++; setLevel(); gameState = 1;
  }  
  textSize(100);
  textAlign(CENTER);
  fill(196, 63, 30);
  text("Level "+level+"\nScore: "+score, width/2, height/2);
}
