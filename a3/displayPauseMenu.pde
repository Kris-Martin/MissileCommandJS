/**
 * Purpose: TODO: fill in or remove
 * Arguments: Null
 * Returns: Null
 */
void displayPauseMenu() {
    MenuButton returnToGame = new MenuButton("Return To Game", width/2, height/3);
    MenuButton backToMain = new MenuButton("Back to main", width/2, height * 4.5/5);
    backToMain.thirdDisplay();
    returnToGame.thirdDisplay();
    if (returnToGame.pressed()) {
        gameState = 1;
    }  
    if (backToMain.pressed()) {
      sound.music.stop();
        setup();
        level = 0;
        gameState = 0;
    } 
    textSize(100);
    textAlign(CENTER);
    fill(196, 63, 30);
    text("Level "+level+"\nScore: "+score, width/2, height/2);
}
