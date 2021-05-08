// Purpose:  A class to manage images and graphics.
class Image {

    PImage city1,
        cityRubble,
        cannonBase, 
        cannonWheel, 
        cannonBarrel, 
        background1;
    
    PImage[] cityOnFire;
    final int CITY_ON_FIRE_IMAGES = 2;
        
    PFont menuFont, zigBlack;


    /**
     * Purpose:  TODO: fill in.
     * Properties:
     * Return: 
     */
    Image() {

        loadImages();
        loadFonts();
        background1.resize(width, height);
    }


    /**
     * Purpose:  TODO: fill in.
     * Properties:
     * Return: 
     */
    void loadImages() {
        
        background1 = loadImage("images/NebulaBackground2.png");
        
        city1 = loadImage("images/city1.png");
        loadCityOnFire();
        cityRubble = loadImage("images/cityRubble.png");
        
        
        cannonBase = loadImage("images/cannonBase.png");
        cannonWheel = loadImage("images/cannonWheel.png");
        cannonBarrel = loadImage("images/cannonBarrel.png"); 
    }
    
    
    /**
     * Purpose:  TODO: fill in.
     * Properties:
     * Return: 
     */
    void loadCityOnFire() {
        cityOnFire = new PImage[CITY_ON_FIRE_IMAGES];
        
        for (int i = 0; i < cityOnFire.length; i++) {
            String str = "images/cityOnFire/" + i + ".png";
            cityOnFire[i] = loadImage(str);
        }
    }


    /**
     * Purpose:  TODO: fill in.
     * Properties:
     * Return: 
     */
    void loadFonts() {
        zigBlack = loadFont("data/heading48.vlw");
        menuFont = loadFont("data/menu76.vlw");
    }
}
