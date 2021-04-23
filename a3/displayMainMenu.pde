PVector startGame = new PVector();
PVector options = new PVector();
PVector highScores = new PVector();


void displayMainMenu() {
  background(0,0,16);
  displayOptionsButton();
  displayStartGameButton();
  displayHighScoresButton();
  displayHeading();
  drawStars();
  sound.intro.loop();
}

void displayStartGameButton() {
  float R = random(0, 255);
  float G = random(0, 255);
  float B = random(0, 255);
  if ((mouseX > width * 3/12) & (mouseX < width * 10/12) & (mouseY > height * 2/5) & mouseY < height * 3/5) {
    R = 255;
    G = 255;
    B = 255;
    if(mousePressed){
      gameState = 1;
    }

  }
  textAlign(LEFT);
  fill(R, G, B);
  startGame.x = width * 3.2/12;
  startGame.y =  height * 2.5/5;
  textFont(image.menuFont);
  String startGameTxt = "Start Game";
  text(startGameTxt.toUpperCase(), startGame.x, startGame.y);
}

void displayOptionsButton() {
  float R = random(0, 255);
  float G = random(0, 255);
  float B = random(0, 255);
  if ((mouseX > width * 4/12) & (mouseX < width * 8/12) & (mouseY > height * 3/5) & mouseY < height * 4/5) {
    R = 255;
    G = 255;
    B = 255;
    if(mousePressed){
      gameState = 2;
    }
  }
  textAlign(LEFT);
  fill(R, G, B);
  options.x = width * 4/12;
  options.y =  height * 3.5/5;
  textFont(image.menuFont);
  String startGameTxt = "Options";
  text(startGameTxt.toUpperCase(), options.x, options.y);
}

void displayHighScoresButton() {
  float R = random(0, 255);
  float G = random(0, 255);
  float B = random(0, 255);
  if ((mouseX > width * 3/12) & (mouseX < width * 10/12) & (mouseY > height * 4/5) & mouseY < height * 5/5) {
    R = 255;
    G = 255;
    B = 255;
  }
  textAlign(LEFT);
  fill(R, G, B);
  highScores.x = width * 3.1/12;
  highScores.y =  height * 4.5/5;
  textFont(image.menuFont);
  String startGameTxt = "High Scores";
  text(startGameTxt.toUpperCase(), highScores.x, highScores.y);
}


// these 2 functions displayHeading and drawStars need to be in all the menus
void displayHeading() {
  textAlign(LEFT, BOTTOM);
  color headingColor = color(random(0, 255), random(0, 255), random(0, 255));
  fill(headingColor);
  PVector heading = new PVector();
  heading.x = width/36;
  heading.y = height/5;
  PFont headingFont = loadFont("heading48.vlw");
  textFont(headingFont);
  String headingString = "Missile Command";
  text(headingString.toUpperCase(), heading.x, heading.y);
}

//this function needs to be called last in the draw loop because of the translate function it will translate all elements called after
void drawStars() {
  translate(0.5*width, 0.5*height);
  // Update and draw all stars
  for (int i=0; i<stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
}
