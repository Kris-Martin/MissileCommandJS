/**
 * Purpose: ?
 * Arguments: Null
 * Returns: Null
 */
void displayGameOver() {
  textSize(100);
  textAlign(CENTER);
  fill(240, 80, 80);
  //text("Score", width/2, height/2);
  if (gameState == -1) {
    MenuButton score = new MenuButton("Score", width/2, height *3/8);
    score.secondaryDisplay();
    MenuButton returnToMain = new MenuButton("Return to main", width/2, height *7/8);
    returnToMain.secondaryDisplay();
    if (returnToMain.pressed()) {
      gameState = 0;
    }
  }
}
