/**
 * Purpose: TODO: fill in AND add comments to below code.
 * Args: Null
 * Returns: Null
 */
void displayGameOver() {
    textSize(100);
    textAlign(CENTER);
    fill(240, 80, 80);

    if (gameState == -1) {

        int displayScore = score;
        int displayLevel = level;

        drawGameOverBackground();

        MenuButton gameOver = new MenuButton("Game Over", width/2, height/4);
        MenuButton score = new MenuButton(
            "Score \n" +displayScore, width/2, height *3/8);
        MenuButton levelTitle = new MenuButton(
            "Waves completed \n" + displayLevel, width/2, height *5/8);

        score.secondaryDisplay();
        levelTitle.secondaryDisplay();
        gameOver.headingDisplay();

        MenuButton returnToMain = new MenuButton(
            "Return to main", width/2, height *7/8);
        returnToMain.thirdDisplay();

        if (returnToMain.pressed()) {
            gameState = 0;
            level = 0;
            sound.music = sound.currentlyPlaying();
            sound.music.stop();
            setup();
        }
    }
}
