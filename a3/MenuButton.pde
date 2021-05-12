// A class to manage the Menu.
class MenuButton {
    String buttonText;
    float locationX, locationY;


    /**
     * Purpose: TODO: Fill in
     * Args:  Null
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
        textAlign(LEFT);
        textFont(image.menuFont);
        float R = random(0, 255);
        float G = random(0, 255);
        float B = random(0, 255);
        //change from hard values to PVector buttonDim
        //that way hover/click will be based on button and not some imaginary shape
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
     * Purpose: TODO: Fill in
     * Args:
     * Returns:
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
     * Purpose: TODO: Fill in
     * Args:
     * Returns:
     */
    void thirdDisplay() {
        textAlign(CENTER);
        textFont(image.dialogInput);
        float R = 3;
        float G = 96;
        float B = 165;
        //change from hard values to PVector buttonDim
        //that way hover/click will be based on button and not some imaginary shape
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
     * Args: Null
     * Returns: boolean
     */
    boolean pressed() {
        boolean buttonPressed = false;
        //change from hard values to PVector buttonDim
        //that way hover/click will be based on button and not some imaginary shape
        if ((mouseX <  width * 2/3) & (mouseX > width * 1/3) & (mouseY < locationY + 100) & (mouseY > locationY - 100)) {
            if (mousePressed) {
                buttonPressed = true;
            }
        }
        return buttonPressed;
    }
}
