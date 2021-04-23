//Options Menu and Pause Menu
PVector musicVolume = new PVector();

//To sort
HScrollbar hs1;


void displayPauseMenu(){
   
  displayScrollBar();
  displayMusicVolumeHeading();
  volumeControl();
}


void displayScrollBar() {
  hs1.update();
  hs1.display();
}

void volumeControl() {
  float scrollBarPosition = hs1.getPos();
  float volume = 1.0;
  volume = map(scrollBarPosition, 0, width, 0.0, 1.0);
  sound.intro.amp(volume);
}

void displayMusicVolumeHeading(){
  float R = random(0, 255);
  float G = random(0, 255);
  float B = random(0, 255);
  if ((mouseX > width * 3/12) & (mouseX < width * 10/12) & (mouseY > height * 2/5) & mouseY < height * 3/5) {
    R = 255;
    G = 255;
    B = 255;
  }
  textAlign(LEFT);
  fill(R, G, B);
  musicVolume.x = width * 2.8/12;
  musicVolume.y =  height * 2/5;
  textFont(image.menuFont);
  String startGameTxt = "Music Volume";
  text(startGameTxt.toUpperCase(), musicVolume.x, musicVolume.y);
}
