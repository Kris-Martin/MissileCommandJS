// Purpose:  A class to manage images and graphics.
class Image {

    PImage city,
        cityRubble,
        cannonBase,
        cannonWheel,
        cannonBarrel;

    PImage[] cityOnFire, background;
    int backgroundFrame;
    final int CITY_ON_FIRE_IMAGES = 2;
    final int BACKGROUND_IMAGES = 24;

    PFont menuFont, zigBlack;


    /**
     * Purpose:  Constructor for Image class, loads image and font files.
     * Arguments: None
     * Return: None
     */
    Image() {

        loadImages();
        loadFonts();

        backgroundFrame = 1;
        loadBackground();
    }


    /**
     * Purpose:  Loads image files ready to be used, called in constructor.
     * Images created by Kristy Marin using InkScape.
     * Arguments: None
     * Return: None
     */
    void loadImages() {

        city = loadImage("images/city.png");
        loadCityOnFire();
        cityRubble = loadImage("images/cityRubble.png");


        cannonBase = loadImage("images/cannonBase.png");
        cannonWheel = loadImage("images/cannonWheel.png");
        cannonBarrel = loadImage("images/cannonBarrel.png");
    }


    /**
     * Purpose:  Creates and loads an array of city on fire images.
     * Images created by Kristy Marin using InkScape.
     * Arguments: None
     * Return: None
     */
    void loadCityOnFire() {
        cityOnFire = new PImage[CITY_ON_FIRE_IMAGES];

        for (int i = 0; i < cityOnFire.length; i++) {
            String str = "images/cityOnFire/" + i + ".png";
            cityOnFire[i] = loadImage(str);
        }
    }

    /**
     * Purpose:  Creates and loads an array of background images.
     * Images created by domil123456. From: https://dynamicwallpaper.club/wallpaper/72omz5ynq4
     * Arguments: None
     * Return: None
     */
    void loadBackground() {
        background = new PImage[BACKGROUND_IMAGES];

        for (int i = 1; i < background.length; i++) {
            String str = "images/background/affinitywallpaper-" + i + ".png";
            background[i] = loadImage(str);
            background[i].resize(width, height);
        }
    }


    /**
     * Purpose:  Increments the frame number used to access the background array.
     * Arguments: None
     * Return: None
     */
    void updateBackground() {

        if (backgroundFrame < image.background.length && frameCount % 60 == 0) {
            backgroundFrame++;
        }

        if (backgroundFrame >= image.background.length) {
            backgroundFrame = 1;
        }
    }


    /**
     * Purpose:  Displays background image.
     * Changes as backgroundFrame is updated by updateBackground.
     * Arguments: None
     * Return: None
     */
    void displayBackground() {
        image(image.background[backgroundFrame], 0, 0);
    }

    /**
     * Purpose:  Loads font files. Called in constructor.
     * Arguments: None
     * Return: None
     */
    void loadFonts() {
        zigBlack = loadFont("data/heading48.vlw");
        menuFont = loadFont("data/menu76.vlw");
    }
}
