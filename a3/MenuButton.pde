// A class to create buttons for the menus
class MenuButton {

    String buttonText;
    float locationX, locationY;

    // Global button offset variable to assist with hitting the menu buttons
    int buttonOffset = 50;


    /**
     * Purpose: Constructor, creates buttons.
     * Args:  String for display text and 2 floats for location
     * Returns:  Null
     */
    MenuButton (String buttonText, float locationX, float locationY) {
        this.buttonText = buttonText;
        this.locationX = locationX;
        this.locationY = locationY;
    }

    /**
     * Purpose: Display the menu buttons.
     * Args: Null
     * Returns: Null
     */
    void display() {
        textAlign(CENTER);
        textFont(image.menuFont);
        float R = random(0, 255);
        float G = random(0, 255);
        float B = random(0, 255);
        // hover/click will be based on button and not some imaginary shape
        if ((mouseY < locationY) & (mouseY > locationY - buttonOffset)) {
            R = 255;
            G = 255;
            B = 255;
        }
        fill(R, G, B);
        text(buttonText.toUpperCase(), locationX, locationY);
    }


    /**
     * Purpose: Displays the heading
     * Args:
     * Returns:
     */
    void headingDisplay() {
        textAlign(CENTER, BOTTOM);
        color headingColor = color(3, 96, 165);
        fill(headingColor);
        textFont(image.zigBlack);
        textSize(96);
        text(buttonText.toUpperCase(), locationX, locationY);
    }


    /**
     * Purpose: A secondary button type without hover effect
     * Args: Null
     * Returns: Null
     */
    void secondaryDisplay() {
        textAlign(CENTER);
        textFont(image.dialogInput);
        float R = 3;
        float G = 96;
        float B = 165;
        fill(R, G, B);
        text(buttonText.toUpperCase(), locationX, locationY);
    }


    /**
     * Purpose: Another button type with different style, with hover effect
     * Args: Null
     * Returns: Null
     */
    void thirdDisplay() {
        textAlign(CENTER);
        textFont(image.dialogInput);
        float R = 132;
        float G = 37;
        float B = 201;

        if ((mouseY < locationY + buttonOffset) & (mouseY > locationY - buttonOffset)) {
            R = 255;
            G = 255;
            B = 255;
        }
        strokeWeight(5);
        stroke(#FAF2F2);
        fill(R, G, B);
        text(buttonText.toUpperCase(), locationX, locationY);
    }


    /**
     * Purpose: Mouse click function for the buttons.
     * Args: Null
     * Returns: boolean
     */
    boolean pressed() {
        boolean buttonPressed = false;
        // TODO: change from hard values to PVector buttonDim
        // That way hover/click will be based on button and not imaginary shape
        if ((mouseY < locationY + buttonOffset) &
            (mouseY > locationY - buttonOffset)) {
            if (mousePressed) {
                buttonPressed = true;
            }
        }
        return buttonPressed;
    }
}
