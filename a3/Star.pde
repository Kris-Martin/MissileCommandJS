/**
 * Purpose: Creates a star object, use to create moving star field.
 * Used tutorial https://www.youtube.com/watch?v=17WoOqgXsRM&t=323s
 * as a reference but converted the variables into PVector methods.
 */
class Star {
    PVector position = new PVector(random(-width, width), random(-height, height), random(width));
    PVector speed = new PVector();
    PVector velocity = new PVector();  // TODO: why speed and velocity?
    
    
    Star() {
                                                        //pls put a comment explaining why constructor is empty. and shouldnt the PVectors be initialised here rather than in fields
    }


    /**
     * Purpose:  TODO: fill in
     * Args:  Null
     * Returns:  Null
     */
    void update() {
        velocity.z = -10;  
        position.add(velocity);
        if (position.z<1) {
            position.set(random(-width, width), random(-height, height), width);
        }
    }


    /**
     * Purpose:  TODO: fill in
     * Args:  Null
     * Returns:  Null
     */
    void show() {
        speed.x = map(position.x / position.z, 0, 1, 0, width);
        speed.y =  map(position.y / position.z, 0, 1, 0, height);
        speed.z = width;
        fill(255);
        noStroke();
        float r = map(position.z, 0, width, 10, 0);
        ellipse(speed.x, speed.y, r, r);
    }
}
