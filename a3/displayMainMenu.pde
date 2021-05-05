SoundFile intro;
/*
Purpose: Main Menu display, keep all the logic for the main menu together
*/

/*
Purpose: function to create the main menu
Arguments: Null
Returns: Null
*/
void displayMainMenu() {
  background(0, 0, 16);
  MainMenu startGame = new MainMenu("start game", width * 3.2/12, height/2);
  MainMenu options = new MainMenu("options", width * 4/12, height * 3.5/5);
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
class MainMenu {
  String buttonText;
  float locationX, locationY;

  MainMenu(String buttonText, float locationX, float locationY) {
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



// these 2 functions displayHeading and drawStars need to be in all the menus
void displayHeading() {
  textAlign(LEFT, BOTTOM);
  color headingColor = color(random(0, 255), random(0, 255), random(0, 255));
  fill(headingColor);
  PVector heading = new PVector();
  heading.x = width/24;
  heading.y = height/5;
  PFont headingFont = loadFont("heading48.vlw");
  textFont(headingFont);
  String headingString = "Missile Command";
  text(headingString.toUpperCase(), heading.x, heading.y);
}

//this function needs to be called last in the draw loop 
//because of the translate function it will translate all elements called after
/*
Purpose: draw the star field
Arguments: Null
Returns: Null
*/
void drawStars() {
  translate(0.5*width, 0.5*height);
  // Update and draw all stars
  for (int i=0; i<stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
}
/*
Purpose: load the assets for the main menu
Arguments: Null
Returns: Null
*/
void loadAssets(){
  intro = new SoundFile(this, "intro_trim.wav");
  intro.loop();
    loadFont("heading48.vlw");
}
