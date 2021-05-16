/**
 * Purpose: Displays the main game.
 * Args: Null
 * Returns: Null
 */
void displayGame() {
    image.displayBackground();
    image.displayGround();

    for (Trail t : trails) {
        t.display();
    }
    for (City c : cities) {
        c.display(c.city);
    }
    for (Missile m : missiles) {
        m.display();
    }
    for (Shell s : shells) {
        s.display();
    }
    for (Explosion e : explosions) {
        e.display();
    }

    // Display mouse crossHair, seperated so shells can have crosshairs too.
    player.display();
    displayCrossHair(mousePos, Cursor_Size, 60, 180, 180);
    displayScore();
    displayProgress();

    image.updateBackground();
}


/**
 * Purpose: Displays CrossHair,
 * Args: PVector pos, int size, int r, int g, int b
 * Returns: Null
 */
void displayCrossHair(PVector pos, int size, int r, int g, int b) {
    strokeWeight(2);
    stroke(r, g, b);
    int gap = size/2;
    line(pos.x+gap, pos.y, pos.x+size+gap, pos.y);
    line(pos.x-gap, pos.y, pos.x-size-gap, pos.y);
    line(pos.x, pos.y+gap, pos.x, pos.y+size+gap);
    line(pos.x, pos.y-gap, pos.x, pos.y-size-gap);
}


/**
 * Purpose: Displays score.
 * Args: Null
 * Returns: Null
 */
void displayScore() {
    textFont(image.inGameScore);
    String text = "Score: "+score;
    stroke(0);
    strokeWeight(2);
    fill(50);
    rect(5, 5, width-10, 28, 6);
    fill(60, 180, 120);
    textAlign(LEFT);
    textSize(20);
    text(text, 15, 26);
}


/**
 * Purpose: Displays the missile count / progress of level.
 * Args: Null
 * Returns: Null
 */
void displayProgress() {
    int padding = 6;
    float roundRatio = (float)(width-padding*2)/missileMax;
    stroke(0);
    strokeWeight(2);
    fill(180, 60, 60);

    // Display segmented bar for levels 1-5, then one continuous bar,
    if (level<6){
        for (int i=0; i<missileMax-missileCount; i++) {
            rect(padding+i*(roundRatio), 40, roundRatio, 20, 4);
        }
    }
    else{
        fill(120,30,30);
        rect(padding, 40, roundRatio*(missileMax-missileCount), 20, 4);
    }
}
