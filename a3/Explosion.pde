/*
Purpose:  Explosions triggerd by shell, they grow and shrink, destroying all they hit
*/
class Explosion{
  boolean exist;
  
  PVector pos = new PVector();
  int time, duration;
  int radius, size;
  int destroyCount, scoreAdd;
  
  
  
  /*
  Purpose:  Constructor
  Args:
  Returns:
  */
  Explosion(PVector position){
    exist = true;
    
    pos.set(position);
    
    time=0;
    duration = 32;
    radius = 0;
    size = 64;    
    destroyCount = 0;
    scoreAdd = 0;
  }
  
  
  
  /*
  Purpose:  Processes object
  Args:
  Returns:
  */
  void process(){
    time++;
    //radius grows and shrinks over duration.
    radius = (int) (size -abs(duration-time)*((float)size/duration));  //need to fix. so that duration doesnt need to match size
    
    //detect missile collision, destroy and tally destroyCount based on number destroyed
    for (Missile m : missiles){
      if (pos.dist(m.pos)<(radius+m.dim.x)/2){
        m.exist = false;
        destroyCount++;
      }
    }
    //score to add = count^2 + closeness to ground all time by 100
    scoreAdd = (int)((pow(destroyCount,2)+((float)pos.y/height))*100);
    
    //end explosion, add points to score
    if (time>duration*2){
      score+= scoreAdd;
      exist=false;
    }
  
  }
  
  
  
  /*
  Purpose:  Displays object
  Args:
  Returns:
  */
  void display(){
    //some reason i am either getting double display or double object
    stroke(0);
    strokeWeight(1);
    fill(240,80,80);
    ellipse(pos.x,pos.y,radius,radius);
    fill(80,240,80);
    //display score addition
    if (destroyCount>0){
      textSize(20*destroyCount);
      text("+"+scoreAdd,pos.x+size/2,pos.y);
    }
  }
}
