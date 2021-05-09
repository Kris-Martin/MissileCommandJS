/**
 * Purpose: basically upgrades menu
 * Args: Null
 * Returns: Null
 */
void displayLevelMenu() {
    MenuButton nextLevel = new MenuButton("click to start next level", width/2, height/3);
    nextLevel.thirdDisplay();
    if (nextLevel.pressed()) {
        level ++;
        setLevel();
        gameState = 1;
    }
    textSize(100);
    textAlign(CENTER);
    fill(196, 63, 30);
    text("Level "+level+"\nScore: "+score, width/2, height/2);
}
