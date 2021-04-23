/*
Purpose: The pseudo-health of the player. the static objects to be protected, potentially have variant textures to display city health
 */
class City {
  //fields
  int health, healthMax;
  PVector pos = new PVector();  //not needed, but consistant
  PVector dim = new PVector();

  //constructors
  City(int PositionX) {
      healthMax = 128*level;
      health = healthMax;
      pos.x = PositionX;
      pos.y = height;
      dim.x = 80;
      dim.y = 40;
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
    if (health>0){
    tint(255,health*(255./healthMax));
    image(image.city1, pos.x-dim.x/2, height-dim.y, dim.x, dim.y);
    tint(255,255);
    }
  }
}
