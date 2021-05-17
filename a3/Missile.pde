// Purpose: The hostile ammunition attacking the cities.
class Missile {
    boolean exist;

    PVector pos = new PVector();
    PVector vel = new PVector();
    PVector dim = new PVector();
    float velocity;
    int trailLength;


    /**
     * Purpose:  Missile constructor
     * Args:  Null
     * Return:  Null
     */
    Missile() {
        exist = true;
        dim.x = 12;
        dim.y = 12;
        pos.x = random(0, width);
        pos.y = 0;
        velocity = 1;
        trailLength = 128;
        
        //Randomise direction based on initial pos, so they are more likely to * stay in window.
        vel.set(new PVector(random(-pos.x/width, (width-pos.x)/width), 1)
            .normalize().mult(velocity));
    }


    /**
     * Purpose:  Processes Missile
     * Args:  Null
     * Return:  Null
     */
    void process() {
        // Add velocity
        pos.add(vel);

        // Create trail
        trails.add(new Trail(pos, vel, trailLength, (int)dim.x, #f0c000));

        if (pos.y>height) {
            exist = false;
            // Numbers should be replaced with upgradable values / final vars
            explosions.add(new Explosion(pos, 128, 64, false));
        }
    }


    /**
     * Purpose:  displays Missile
     * Args:  Null
     * Return:  Null
     */
    void display() {
        // Basic missile
        strokeWeight(2);
        stroke(0);
        fill(#F70505);
        ellipse(pos.x, pos.y, dim.x, dim.y);
    }
}
