// A class to manage files, images, sounds and assets.

class Resources {
    
    PImage city1, cannonBase, cannonWheel, cannonBarrel, background1;

    Resources() {
        
        loadImages();
        background1.resize(width, height);
    }
    
    void loadImages() {
        city1 = loadImage("images/city1.png");
        cannonBase = loadImage("images/cannonBase.png");
        cannonWheel = loadImage("images/cannonWheel.png");
        cannonBarrel = loadImage("images/cannonBarrel.png");
        background1 = loadImage("images/NebulaBackground2.png");
    }
    
}
