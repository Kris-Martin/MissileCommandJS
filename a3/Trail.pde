/*
Purpose: The trails that follow missiles and shells
*/
class Trail{
  boolean exist;
  int time, duration;
  int size; //?
  PVector pos = new PVector();
  color col;
  
  Trail(PVector position, int lifeTime, color colour){
    exist = true;
    pos.set(position);
    duration = lifeTime;
    col = colour;
  }
  
  
  
/*
Purpose: Initialtes all starting parameters
Arguments: Null
Returns: Null
*/
  void process(){
    time++;
    if (time>duration){
      exist = false;
    }
  }
  
  
  
/*
Purpose: Initialtes all starting parameters
Arguments: Null
Returns: Null
*/
  void display(){
    stroke(col,256-time*(256/duration));
    point(pos.x,pos.y);
  }
}
