/*
Purpose: The ammunition fired by players cannon. Potentially add subclasses or just field specific methods for varient shells 
*/
class Shell{
  boolean exist;
  
  PVector pos = new PVector();
  PVector vel = new PVector();
  PVector dim = new PVector();

  PVector aim = new PVector();
  
  int velocity;
  
  
  /*
  Purpose:  Spawns new shell firing from cannon, towards target set by mouse press
  Args:
  Returns:
  */
  Shell(PVector target){
    exist = true;
    dim.x = 8;
    dim.y = 8;
    pos.x = player.barrelPos.x;
    pos.y = player.barrelPos.y;
    
    aim.set(target);
    
    velocity=4;
    //create vel as heading of diff vector between 2 points, pos and target
    vel.set(vectorDiff(target,pos).normalize().mult(velocity));
    
  }
  
  
  
  void process(){
    //add velocity
    pos.add(vel);
    
    //create trail
    trails.add(new Trail(pos,vel,64,(int)dim.x,#00a0f0));
    
    //detect missile collision
    boolean hit = false;
    for (Missile m : missiles){
      if (pos.dist(m.pos)<(dim.x+m.dim.x)/2){
        hit = true;
        break;
      }
    }
    
    //trigger explosion if reach target or hit missile
    if (pos.dist(aim)<velocity || hit){
      explosions.add(new Explosion(pos));
      exist=false;
    }
  }
  
  
  
  void display(){
    strokeWeight(2);
    stroke(0);
    fill(80,180,80);
    //why does rectangle draw from side, but ellipse from centre, it keeps screwing with me
    ellipse(pos.x,pos.y,dim.x,dim.y);
    
    displayCrossHair(aim,Cursor_Size/2,180,60,60);
  }
}
