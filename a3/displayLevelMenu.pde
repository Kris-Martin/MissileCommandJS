/**
 * Purpose: All the logic for the inbetween level menu display in the one area 
 * Args: Null
 * Returns: Null
 */
void displayLevelMenu() {
    //create nextlevel button and display
    MenuButton nextLevel = new MenuButton("click to start next level", width/2, height/3);  //again, should creation of buttons be in setup? / load resources type function called by setup?
    nextLevel.thirdDisplay();
    
    //if click on next level button, set next level and start game
    if (nextLevel.pressed()) {
        level ++;
        setLevel();
        gameState = 1;
    }
    
    //display score
    textFont(image.zigBlack);
    textSize(100);
    textAlign(CENTER);
    fill(120, 180, 60);
    text("Level "+level+"\nScore: "+score, width/2, height/2);
}
