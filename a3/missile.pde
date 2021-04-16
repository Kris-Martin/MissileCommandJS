/*
Purpose: The hostile ammunition attacking the cities. Potentially add subclasses or just field specific methods for varient missiles 
 */
class missile {
  //fields
  PVector pos = new PVector();
  PVector vel = new PVector();
  PVector dim = new PVector();
  int velocity;
  int reloadTime;
  int reloadPeriod;
  //constructors

  missile() {
    dim.x = 20;
    dim.y = 20;
    pos.x = random(0, width);
    pos.y = 0;
    velocity = 2;
    vel.set(0, pos.y++);
    reloadTime = 0;
    reloadPeriod = 128;
  }

  //methods
  void process() {
    pos.add(vel);
  }



  void display() {
    fill(#F70505);
    ellipse(pos.x, pos.y, dim.x, dim.y);
  }
}
