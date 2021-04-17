/*
Purpose: The pseudo-health of the player. the static objects to be protected, potentially have variant textures to display city health
 */
class City {

    //fields
    int health;
    int posX;

    PVector dim = new PVector();

    //constructors
    City(int PositionX) {
        this.health = cityDefaultHealth*level;
        this.posX = PositionX;
        this.dim.x = 80;
        this.dim.y = 40;
    }

    /*
      Purpose: Displays the object
      Arguments: Null
      Returns: Null
    */
    void process() {
        
    }

    /*
    Purpose: Displays the object
    Arguments: Null
    Returns: Null
    */
    void display() {
        
        //change this
        image(resource.city1, posX-dim.x/2, height-dim.y, dim.x, dim.y);
    }
}
