/**
 * Purpose: TODO: fill in
 * Arguments: Null
 * Returns: Null
 */
void processGameMenu() {
    time-=16;
    textSize(100);
    textAlign(CENTER);
    text("Level "+level+"\nScore: "+score, width/2, height/2);
    if (time<0) {
        level++;
        setLevel();
        gameState = 1;
    }
}
