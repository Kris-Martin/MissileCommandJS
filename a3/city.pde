/*
Purpose: The pseudo-health of the player. the static objects to be protected, potentially have variant textures to display city health
*/
class city{
  //fields
  int health;
  int posX;
  PVector dim = new PVector();
  
  //constructors
  city(int Health, int PositionX){
    this.health = Health;
    this.posX = PositionX;
    this.dim.x = cityDim.x;
    this.dim.y = cityDim.y;
  }
  
  
  void display(){
    //change this
    image(city1,posX-dim.x/2,height-dim.y,dim.x,dim.y);
  }
  
  
  //methods
}
