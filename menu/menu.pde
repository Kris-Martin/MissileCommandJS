//Star[] stars = new Star[400];
PFont zigBlack;
String[] fontList = PFont.list();
PFont menuFont;

HScrollbar hs1;
import processing.sound.*;
SoundFile intro;
int gameState = 0;
//font size and style 112 for heading 76 for menu 

void setup() {
  size(1130, 768);
  loadAssets();
  initScrollBar();
  initStarsArray();

}

void draw() {
  background(0);
  displayHeading();
  switch(gameState) {
  case 1:
    displayPauseMenu();
    break;
  case 0:
    displayMainMenu();
    break;
  }
  drawStars();
}

//these 2 classes need to be initialize in the setup loop,
void initStarsArray(){
    for (int i=0; i<stars.length; i++) 
    stars[i] = new Star();
  }

void initScrollBar(){
hs1 = new HScrollbar(0, height/2-8, width, 16, 16);
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
