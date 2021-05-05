// These 2 functions displayHeading and drawStars need to be in all the menus
Star[] stars = new Star[400];

void displayHeading() {
    textAlign(CENTER, BOTTOM);
    color headingColor = color(random(0, 255), random(0, 255), random(0, 255));
    fill(headingColor);
    PVector heading = new PVector();
    heading.x = width/2;
    heading.y = height/4;
    PFont headingFont = image.zigBlack;
    textFont(headingFont);
    textSize(96);
    String headingString = "Missile Command";
    text(headingString.toUpperCase(), heading.x, heading.y);
}

// This function needs to be called last in the draw loop because of the translate function it will translate all elements called after
void drawStars() {
    translate(0.5*width, 0.5*height);
    // Update and draw all stars
    for (int i=0; i<stars.length; i++) {
        stars[i].update();
        stars[i].show();
    }
}
