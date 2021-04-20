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
  Explosion(PVector position,int power, int lifeTime){
    exist = true;
    
    pos.set(position);
    
    time=0;
    duration = lifeTime;
    radius = 0;
    size = power;    
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
    
    missileCollide();
    cityCollide();
    
    //end explosion, add points to score
    if (time>duration*2){
      score+= scoreAdd;
      exist=false;
    }
  
  }
  
  
  
  /*
  Purpose:  
  Args:
  Returns:
  */
  void missileCollide(){
    //detect missile collision, destroy and tally destroyCount based on number destroyed
    for (Missile m : missiles){
      if (pos.dist(m.pos)<(radius+m.dim.x)/2){
        m.exist = false;
        sound.shatterShotExplosion.play();
        destroyCount++;
      }
    }
    //score to add = count^2 + closeness to ground all time by 100
    if (destroyCount>0){
      scoreAdd = (int)((pow(destroyCount+(float)pos.y/height,2))*250);
    }
  }  
  
  
  
  /*
  Purpose:  Displays object
  Args:
  Returns:
  */
  void cityCollide(){
    //detect city collision, deal damage based on proximity (general% or closest discrete?)
    for (City c : cities){
      float dist = pos.dist(c.pos);
      if (dist<(radius+c.dim.x)/2){
        c.health -= size/pow(dist,2);
        if (c.health<0){
          c.health=0;
        }
      }
    }
  }  
  
  
  
  /*
  Purpose:  Displays object
  Args:
  Returns:
  */
  void display(){
    stroke(0);
    strokeWeight(1);
    fill(240,80,80);
    ellipse(pos.x,pos.y,radius,radius);
    fill(80,240,80);
    //display score addition
    if (destroyCount>0){
      textSize(scoreAdd/(25+level));  //alter based on level, as you expect increasing points
      text("+"+scoreAdd,pos.x+size/2,pos.y);
    }
  }
}
