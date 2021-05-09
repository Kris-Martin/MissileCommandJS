// A class to create and manage the cities that the player has to defend.
class City {
    // The health of the city, when it reaches 0 city is destroyed.
    int health, healthMax;
    PVector pos = new PVector();  //not needed, but consistant
    PVector dim = new PVector();
    
    PImage city = image.city;
    boolean isAlive = true;


    /**
     * Purpose: City constructor
     * Args: int PostionX
     * Returns: Null
     */
    City(int PositionX) {
        healthMax = 128 * level;
        health = healthMax;
        pos.x = PositionX;
        pos.y = height;
        dim.x = 80;
        dim.y = 40;
    }
    
    
    void draw(PImage city) {
        float x = pos.x - dim.x / 2;
        float y = height - dim.y - image.GROUND_HEIGHT/3;
        
        image(city, x, y, dim.x, dim.y);
    }
    
    // TODO: Animate explosion with mushroom cloud?
    /**
     * Purpose: Displays the city
     * Args: Null
     * Returns: Null
     */
    void display() {
        
        // If health is less than health max shows city flashing on fire.
        if (health < healthMax && health > 0) {
            // Increment frame every 10 frames.
            if (frameCount % 10 == 0) {
                image.cityFrame++;
            }
            // Reset to frame to 1 when end of Array reached.
            if (image.cityFrame >= image.cityOnFire.length) {
                image.cityFrame = 0;
            }
            city = image.cityOnFire[image.cityFrame];
        }
        
        // City burns before turning to rubble when health reaches 0.
        if (health < 1 && isAlive == true) {
            
            // Set cityFrame to start of Array
            if (image.cityFrame >= image.cityOnFire.length) {
                image.cityFrame = 0;
            }
            
            
            // Increment frame every 10 frames.
            if (frameCount % 10 == 0) {
                city = image.cityOnFire[image.cityFrame];
                image.cityFrame++;
            }
            
            // Set frame to rubble when end of Array is reached.
            if (image.cityFrame >= image.cityOnFire.length) {
                city = image.cityRubble;
                isAlive = false;
            }
        }
        // Display the city
        draw(city);
    }
}
