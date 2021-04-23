// A class to manage files, images, sounds and assets.

class Resources {
    
    PImage city1, cannonBase, cannonWheel, cannonBarrel, background1;
    SoundFile intro;
    PFont menuFont, zigBlack;
    String[] fontList = PFont.list();  //?

    Resources() {
        
        loadImages();
        loadSounds();
        loadStarsArray();
        loadScrollBar();
        background1.resize(width, height);
    }
    
    void loadImages() {
        city1 = loadImage("images/city1.png");
        cannonBase = loadImage("images/cannonBase.png");
        cannonWheel = loadImage("images/cannonWheel.png");
        cannonBarrel = loadImage("images/cannonBarrel.png");
        background1 = loadImage("images/NebulaBackground2.png");
    }
    
    void loadSounds(){
        //intro = new SoundFile(this, "intro_trim.wav");  //dont know whats wrong
        //intro.loop();
        loadFont("data/heading48.vlw");
        menuFont = loadFont("data/menu76.vlw");
        
    }
    
    void loadStarsArray(){
      for (int i=0; i<stars.length; i++) 
        stars[i] = new Star();
    }

    void loadScrollBar(){
      hs1 = new HScrollbar(0, height/2-8, width, 16, 16);
    }
    
}
