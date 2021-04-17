/*
Purpose: The hostile ammunition attacking the cities. Potentially add subclasses or just field specific methods for varient missiles 
 */
class Missile {
  boolean exist;
  
  PVector pos = new PVector();
  PVector vel = new PVector();
  PVector dim = new PVector();
  float velocity;
  //constructors

  Missile() {
    exist = true;
    dim.x = 12;
    dim.y = 12;
    pos.x = random(0, width);
    pos.y = 0;
    velocity = 1;
    //randomise direction based on initial pos, so they are more likely to stay in window
    vel.set(new PVector(random(-(width-pos.x)/width,(width-pos.x)/width),1).normalize().mult(velocity));
    sound.fastRocketWhoosh.play();
  }

  //methods
  void process() {
    pos.add(vel);
    if (pos.y>height){
      exist = false;
    }
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
