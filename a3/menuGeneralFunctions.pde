SoundFile intro;

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

//this function needs to be called last in the draw loop because of the translate function it will translate all elements called after
void drawStars() {
  translate(0.5*width, 0.5*height);
  // Update and draw all stars
  for (int i=0; i<stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
}
