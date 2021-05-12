/**
 * Purpose:  TODO: fill in.
 * Args:  Null
 * Return:  Null
 */
void displayMainMenu() {
    background(0, 0, 16);
    
    //should you create buttons in setup, and just a matter of displaying/checking during this function?
    MenuButton startGame = new MenuButton("start game", width * 3/12, height/2);
    MenuButton options = new MenuButton("options", width * 4/12, height * 3.5/5);
    MenuButton heading = new MenuButton("Missile Command", width/2, height/4);        //do you need MenuButton for basic text? ig it doesnt rlly matter
    
    heading.headingDisplay();
    startGame.display();
    options.display();
    
    if (startGame.pressed()) gameState = 1;
    if (options.pressed()) gameState = 2;
    
    stars.draw();
    //displayHeading();              //empty function???
}


/**
 * Purpose: TODO: Fill in
 * Args:
 * Returns:
 */
void displayHeading() {
    textAlign(CENTER, BOTTOM);
    //maybe use an if time%x for color changing so it isnt such strobe
    //space and comment your code some more please
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
