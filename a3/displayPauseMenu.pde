/**
 * Purpose:Keeps the logic of the pause menu logic together
 * Args: Null
 * Returns: Null
 */
void displayPauseMenu() {
    
    MenuButton returnToGame = new MenuButton("Return To Game", width/2, height/3);      //same question third time, should buttons be set up from setup()/createButtons() etc?
    MenuButton backToMain = new MenuButton("Back to main", width/2, height * 4.5/5);    //otherwise, good code :)
    
    backToMain.thirdDisplay();
    returnToGame.thirdDisplay();
    
    if (returnToGame.pressed()) {
        gameState = 1;
    }
    
    if (backToMain.pressed()) {
        sound.music = sound.currentlyPlaying();
        sound.music.stop();
        setup();
        level = 0;
        gameState = 0;
    }
    
    textSize(100);
    textAlign(CENTER);
    fill(120, 180, 60);
    text("Level "+level+"\nScore: "+score, width/2, height/2);
}
