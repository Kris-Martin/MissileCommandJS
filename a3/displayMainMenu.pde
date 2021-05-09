/**
 * Purpose:  TODO: fill in.
 * Arguments:
 * Return:
 */
void displayMainMenu() {
    background(0, 0, 16);
    MenuButton startGame = new MenuButton("start game", width * 3/12, height/2);
    MenuButton options = new MenuButton("options", width * 4/12, height * 3.5/5);
    MenuButton heading = new MenuButton("Missile Command", width/2, height/4);
    startGame.display();

    options.display();
    if (startGame.pressed()) gameState = 1;
    if (options.pressed()) gameState = 2;
    heading.headingDisplay();
    //displayHeading();
    stars.draw();
}



// Purpose: Class for the main menu.
class MenuButton {
    String buttonText;
    float locationX, locationY;


    /**
     * Purpose: TODO: Fill in
     * Arguments:
     * Returns:
     */
    MenuButton (String buttonText, float locationX, float locationY) {
        this.buttonText = buttonText;
        this.locationX = locationX;
        this.locationY = locationY;
    }


    /**
     * Purpose: Display the menu buttons.
     * Arguments: Null
     * Returns: Null
     */
    void display() {
        textAlign(LEFT);
        textFont(image.menuFont);
        float R = random(0, 255);
        float G = random(0, 255);
        float B = random(0, 255);
        if ((mouseX < width * 2/3) & (mouseX > width * 1/3) & (mouseY < locationY + 100) & (mouseY > locationY - 100)) {
            R = 255;
            G = 255;
            B = 255;
        }
        fill(R, G, B);
        text(buttonText.toUpperCase(), locationX, locationY);
    }


    /**
     * Purpose: TODO: Fill in
     * Arguments:
     * Returns:
     */
    void headingDisplay() {
        textAlign(CENTER, BOTTOM);
        color headingColor = color(3, 96, 165);
        fill(headingColor);
        PFont headingFont = image.zigBlack;
        textFont(headingFont);
        textSize(96);
        text(buttonText.toUpperCase(), locationX, locationY);
    }


    /**
     * Purpose: TODO: Fill in
     * Arguments:
     * Returns:
     */
    void secondaryDisplay() {
        textAlign(CENTER);
        PFont Impact;
        Impact = createFont("DialogInput", 56);
        textFont(Impact);
        float R = 3;
        float G = 96;
        float B = 165;
        fill(R, G, B);
        text(buttonText.toUpperCase(), locationX, locationY);
    }


    /**
     * Purpose: TODO: Fill in
     * Arguments:
     * Returns:
     */
    void thirdDisplay() {
        textAlign(CENTER);
        PFont Impact;
        Impact = createFont("DialogInput", 56);
        textFont(Impact);
        float R = 3;
        float G = 96;
        float B = 165;
        if ((mouseX < width * 2/3) & (mouseX > width * 1/3) & (mouseY < locationY + 100) & (mouseY > locationY - 100)) {
            R = 255;
            G = 255;
            B = 255;
        }
        fill(R, G, B);
        text(buttonText.toUpperCase(), locationX, locationY);
    }


    /**
     * Purpose: Mouse click function for the buttons.
     * Arguments: Null
     * Returns: boolean
     */
    boolean pressed() {
        boolean buttonPressed = false;
        if ((mouseX <  width * 2/3) & (mouseX > width * 1/3) & (mouseY < locationY + 100) & (mouseY > locationY - 100)) {
            if (mousePressed) {
                buttonPressed = true;
            }
        }
        return buttonPressed;
    }
}


/**
 * Purpose: TODO: Fill in
 * Arguments:
 * Returns:
 */
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
