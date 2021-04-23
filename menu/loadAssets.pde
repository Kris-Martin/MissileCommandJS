void loadAssets(){
  intro = new SoundFile(this, "intro_trim.wav");
  intro.loop();
    loadFont("heading48.vlw");
  menuFont = loadFont("menu76.vlw");
}
