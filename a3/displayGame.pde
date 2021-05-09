/**
 * Purpose: TODO: fill in
 * Arguments: Null
 * Returns: Null
 */
void displayGame() {
    //levelBackground(level);
    
    //image(image.background[1], 0, 0);
    image.displayBackground();
    
    for (Trail t : trails) {
        t.display();
    }
    for (City c : cities) {
        c.display();
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
    
    // Display mouse crossHair, seperated so shells can have crosshairs too
    player.display();
    displayCrossHair(mousePos, Cursor_Size, 60, 180, 180);
    displayScore();
    displayProgress();
    
    image.updateBackground();
}


/**
 * Purpose: Displays level background
 * Arguments: Current level
 * Returns: Null
 */
//void levelBackground(int level) {
//    // TODO: Change this
//    switch(level) {
//    case 1:
//        image(image.background[1], 0, 0);
//        break;
//    default:
//        image(image.background[1], 0, 0);
//        break;
//    }
//}


/**
 * Purpose: Displays CrossHair
 * Arguments: Current level
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
 * Purpose: Displays score
 * Arguments: Null
 * Returns: Null
 */
void displayScore() {
    PFont Impact;
    Impact = createFont("Impact", 42);
    // TODO: Change this
    textFont(Impact);
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
 * Purpose: Displays the missile count
 * Arguments: Null
 * Returns: Null
 */
void displayProgress() {
    stroke(240, 120, 80);
    strokeWeight(2);
    int padding = 6;
    float roundRatio = (float)(width-padding*2)/missileMax;
    for (int i=0; i<missileMax-missileCount; i++) {
        stroke(0);
        strokeWeight(2);
        fill(180, 60, 60);
        rect(padding+i*(roundRatio), 40, roundRatio, 20, 4);
    }
}
