

void displayMainMenu() {
  background(0, 0, 16);
  MenuButton startGame = new MenuButton("start game", width * 3/12, height/2);
  MenuButton options = new MenuButton("options", width * 4/12, height * 3.5/5);
  startGame.display();
  options.display();
  if (startGame.pressed()) gameState = 1; 
  if (options.pressed()) gameState = 2;
  displayHeading();
  drawStars();
}
/*
Purpose: class for the main menu
 Arguments: Null
 Returns: Null
 */
class MenuButton {
  String buttonText;
  float locationX, locationY;

  MenuButton (String buttonText, float locationX, float locationY) {
    this.buttonText = buttonText;
    this.locationX = locationX;
    this.locationY = locationY;
  }
  /*
Purpose: display the menu buttons
   Arguments: Null
   Returns: Null
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
  /*
Purpose: mouse click function for the buttons
   Arguments: Null
   Returns: boolean
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
