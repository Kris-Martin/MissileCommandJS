//https://www.youtube.com/watch?v=17WoOqgXsRM&t=323s
//reference but converted the variables into PVector methods
  


Star[] stars = new Star[400];
class Star {
  PVector location = new PVector(random(-width, width), random(-height, height), random(width));
  PVector speed = new PVector();
  PVector velocity = new PVector();
  //pVector
  Star() {
  }

  void update() {
    velocity.z = -10;  
    location.add(velocity);
    if (location.z<1) {
      location.set(random(-width, width), random(-height, height), width);
    }
  }

  void show() {
    speed.x = map(location.x / location.z, 0, 1, 0, width);
    speed.y =  map(location.y / location.z, 0, 1, 0, height);
    speed.z = width;
    fill(255);
    noStroke();
    float r = map(location.z, 0, width, 10, 0);
    ellipse(speed.x, speed.y, r, r);
  }
}
