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
        vel.set(new PVector(random(-pos.x/width, (width-pos.x)/width), 1).normalize().mult(velocity));
    }

    //methods
    void process() {
        //add velocity
        pos.add(vel);

        //create trail
        trails.add(new Trail(pos, vel, 128, (int)dim.x, #f0c000));

        //change this once collision to cities and ground is implemented
        if (pos.y>height) {
            exist = false;
            //numbers should be replaces with upgradable values
            explosions.add(new Explosion(pos, 128, 64, false));
        }
    }



    void display() {    
        //basic missile
        strokeWeight(2);
        stroke(0);
        fill(#F70505);
        ellipse(pos.x, pos.y, dim.x, dim.y);
    }
}
