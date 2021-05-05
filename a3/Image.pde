// 
/**
 * Purpose:  A class to manage images and graphics.
 * Properties: TODO: fill in.
 */
class Image {

    PImage city1, cannonBase, cannonWheel, cannonBarrel, background1;
    PFont menuFont, zigBlack;
    //String[] fontList = PFont.list();

    /**
     * Purpose:  TODO: fill in.
     * Properties:
     * Return: 
     */
    Image() {

        loadImages();
        loadStarsArray();
        loadScrollBar();
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

    /**
     * Purpose:  TODO: fill in.
     * Properties:
     * Return: 
     */
    void loadStarsArray() {
        for (int i = 0; i < stars.length; i++) 
            stars[i] = new Star();
    }

    /**
     * Purpose:  TODO: fill in.
     * Properties:
     * Return: 
     */
    void loadScrollBar() {
        hs1 = new HScrollbar(0, height / 2 - 8, width, 16, 16);
    }
}
