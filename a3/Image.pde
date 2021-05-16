// Purpose: A class to manage images and graphics.
class Image {

    PImage city,
        cityRubble,
        cannonBase,
        cannonWheel,
        cannonBarrel;

    PImage[] cityOnFire, background;

    int backgroundFrame, cityFrame;

    final int CITY_ON_FIRE_IMAGES = 12;
    final int BACKGROUND_IMAGES = 24;
    final int GROUND_HEIGHT = 15;

    PFont menuFont, zigBlack, dialogInput, inGameScore;


    /**
     * Purpose: Constructor for Image class, loads image and font files.
     * Args: Null
     * Return: Null
     */
    Image() {
        loadImages();
        loadFonts();

        backgroundFrame = 0;
        cityFrame = 0;

        loadBackground();
    }


    /**
     * Purpose: Loads image files ready to be used, called in constructor.
     * Images created by Kristy Marin using InkScape.
     * Args: Null
     * Return: Null
     */
    void loadImages() {

        city = loadImage("images/city/city1.png");
        loadCityOnFire();
        cityRubble = loadImage("images/cityRubble.png");

        cannonBase = loadImage("images/cannonBase.png");
        cannonWheel = loadImage("images/cannonWheel.png");
        cannonBarrel = loadImage("images/cannonBarrel.png");
    }

    /**
     * Purpose: Loads font files. Called in constructor.
     * Args: Null
     * Return: Null
     */
    void loadFonts() {
        zigBlack = loadFont("fonts/heading48.vlw");
        menuFont = loadFont("fonts/menu76.vlw");
        dialogInput = loadFont("fonts/dialogInput56.vlw");
        inGameScore = loadFont("fonts/dialogInput56.vlw");
    }

    /**
     * Purpose:  Creates and loads an array of city on fire images.
     * Images created by Kristy Marin using InkScape.
     * Args: Null
     * Return: Null
     */
    void loadCityOnFire() {
        cityOnFire = new PImage[CITY_ON_FIRE_IMAGES];

        for (int i = 1; i <= cityOnFire.length; i++) {
            String str = "images/city/city" + i + ".png";
            cityOnFire[i-1] = loadImage(str);
        }
    }


    /**
     * Purpose: Creates and loads an array of background images.
     * Images created by domil123456.
     * From: https://dynamicwallpaper.club/wallpaper/72omz5ynq4
     * Args: Null
     * Return: Null
     */
    void loadBackground() {
        background = new PImage[BACKGROUND_IMAGES];

        for (int i = 1; i <= background.length; i++) {
            String str = "images/background/affinitywallpaper-" +i+ ".png";
            background[i-1] = loadImage(str);
        }
    }


    /**
     * Purpose: Changes background image using global time variable.
     * Every 1200 ticks.
     * Args: Null
     * Return: Null
     */
    void updateBackground() {

        if (backgroundFrame < image.background.length && time % 1200 == 0) {
            backgroundFrame++;
        }

        if (backgroundFrame >= image.background.length) {
            backgroundFrame = 0;
        }
    }


    /**
     * Purpose: Displays background image.
     * Changes as backgroundFrame is updated by updateBackground.
     * Args: Null
     * Return: Null
     */
    void displayBackground() {
        image(image.background[backgroundFrame], 0, 0);
    }


    /**
     * Purpose: Creates ground for the cities to sit on.
     * Args: Null
     * Return: Null
     */
    void displayGround() {
        int x = 0;

        noStroke();
        fill(#834444);

        rect(x, height-GROUND_HEIGHT, width, GROUND_HEIGHT);
    }
}
