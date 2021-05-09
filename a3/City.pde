// A class to create and manage the cities that the player has to defend.
class City {
    // The health of the city, when it reaches 0 city is destroyed.
    int health, healthMax;
    PVector pos = new PVector();  //not needed, but consistant
    PVector dim = new PVector();


    /**
     * Purpose: City constructor
     * Arguments: int PostionX
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

    // TODO: Animate explosion with mushroom cloud?
    /**
     * Purpose: Displays the city
     * Arguments: Null
     * Returns: Null
     */
    void display() {
        PImage city = image.city;
        float x = pos.x - dim.x / 2;
        float y = height - dim.y;

        if (health > 0) {
            //tint(255, health * (255 / healthMax));
            city = image.city;
            //tint(255, 255);
        }

        // If health is less than health max shows city flashing on fire.
        if (health < healthMax && health > 0) {

            // Increment frame every 10 frames.
            if (frameCount % 10 == 0) {
                image.cityFrame++;
            }
            // Reset to frame to 1 when end of Array reached.
            if (image.cityFrame >= image.cityOnFire.length) {
                image.cityFrame = 1;
            }
            city = image.cityOnFire[image.cityFrame];
        }

        // Show a picture of rublle when city health reaches 0.
        if (health < 1) {
            city = image.cityRubble;
        }

        // Display the city
        image(city, x, y, dim.x, dim.y);
    }
}
