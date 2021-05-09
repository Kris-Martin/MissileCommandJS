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

    PFont menuFont, zigBlack, impact, dialogInput;


    /**
     * Purpose: Constructor for Image class, loads image and font files.
     * Args: None
     * Return: None
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
     * Args: None
     * Return: None
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
     * Purpose:  Creates and loads an array of city on fire images.
     * Images created by Kristy Marin using InkScape.
     * Args: None
     * Return: None
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
     * Images created by domil123456. From: https://dynamicwallpaper.club/wallpaper/72omz5ynq4
     * Args: None
     * Return: None
     */
    void loadBackground() {
        background = new PImage[BACKGROUND_IMAGES];

        for (int i = 1; i <= background.length; i++) {
            String str = "images/background/affinitywallpaper-" + i + ".png";
            background[i-1] = loadImage(str);
            //background[i].resize(width, height); // If this enabled startup is slower.
        }
    }


    /**
     * Purpose: Increments the frame number used to access the background array.
     * Args: None
     * Return: None
     */
    void updateBackground() {

        if (backgroundFrame < image.background.length && frameCount % 60 == 0) {
            backgroundFrame++;
        }

        if (backgroundFrame >= image.background.length) {
            backgroundFrame = 0;
        }
    }


    /**
     * Purpose: Displays background image.
     * Changes as backgroundFrame is updated by updateBackground.
     * Args: None
     * Return: None
     */
    void displayBackground() {
        image(image.background[backgroundFrame], 0, 0);
    }


    /**
     * Purpose: Loads font files. Called in constructor.
     * Args: None
     * Return: None
     */
    void loadFonts() {
        zigBlack = loadFont("fonts/heading48.vlw");
        menuFont = loadFont("fonts/menu76.vlw");
        impact = loadFont("fonts/impact42.vlw");
        dialogInput = loadFont("fonts/dialogInput56.vlw");
    }
    
    
    /**
     * Purpose: Creates ground for the cities to sit on.
     * Args: None
     * Return: None
     */
    void displayGround() {
        int x = 0;

        noStroke();
        fill(#834444);

        rect(x, height-GROUND_HEIGHT, width, GROUND_HEIGHT);
    }
}
