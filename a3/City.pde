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


    /**
     * Purpose: Displays the city
     * Arguments: Null
     * Returns: Null
     */
    void display() {
        PImage city = image.city1;
        float x = pos.x - dim.x / 2;
        float y = height - dim.y;

        if (health > 0) {
            //tint(255, health * (255 / healthMax));
            city = image.city1;
            //tint(255, 255);   
        } 
        
        if (health < healthMax) {
                int frame = 0;
                
                if (frameCount % 5 == 0 && frame == 1) {
                    frame = 0;
                }
                if (frameCount % 10 == 0 && frame == 0) { 
                    frame = 1;
                }
                city = image.cityOnFire[frame];
            }//else {
        //    city = image.cityRubble;
        //}
        image(city, x, y, dim.x, dim.y);
    }

    // TODO: Have variant textures to display city health?
    // TODO: Animate explosion with mushroom cloud?
}
