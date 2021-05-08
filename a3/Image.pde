// Purpose:  A class to manage images and graphics.
class Image {

    PImage city1, cannonBase, cannonWheel, cannonBarrel, background1;
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
        city1 = loadImage("images/city1.png");
        cannonBase = loadImage("images/cannonBase.png");
        cannonWheel = loadImage("images/cannonWheel.png");
        cannonBarrel = loadImage("images/cannonBarrel.png");
        background1 = loadImage("images/NebulaBackground2.png");
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
