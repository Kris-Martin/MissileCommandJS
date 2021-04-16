/*
Purpose: The hostile ammunition attacking the cities. Potentially add subclasses or just field specific methods for varient missiles 
 */
class missile {
  //fields
  PVector pos = new PVector();
  PVector vel = new PVector();
  PVector dim = new PVector();
  int velocity;
  //constructors

  missile() {
    dim.x = 20;
    dim.y = 20;
    pos.x = random(0, width);
    pos.y = 0;
    velocity = 1;
    //randomise direction based on initial pos, so they are more likely to stay in window
    vel.set(new PVector(random(-(width-pos.x)/width,(width-pos.x)/width),1).normalize().mult(velocity));
  }

  //methods
  void process() {
    pos.add(vel);
  }



  void display() {
    //basic bitch trial, make better
    stroke(250);
    line(pos.x,pos.y,pos.x-vel.x*128,pos.y-vel.y*128);
    
    //basic missile
    stroke(0);
    fill(#F70505);
    ellipse(pos.x, pos.y, dim.x, dim.y);
    

  }
}
