// Purpose: The ammunition fired by players cannon. 
class Shell {
    boolean exist;

    PVector pos = new PVector();
    PVector vel = new PVector();
    PVector dim = new PVector();

    PVector aim = new PVector();

    int velocity;


    /**
     * Purpose:  Spawns new shell firing from cannon, towards target set by 
     * mouse press.
     * Args:  PVector target
     * Returns:  Null
     */
    Shell(PVector target) {
        exist = true;
        dim.x = 8;
        dim.y = 8;
        pos.x = player.barrelPos.x;
        pos.y = player.barrelPos.y;

        aim.set(target);
        velocity=4;
        
        // Create vel as heading of diff vector between 2 points, pos and target
        vel.set(vectorDiff(target, pos).normalize().mult(velocity));
    }


    /**
     * Purpose:  processes Shell
     * Args:  Null
     * Returns:  Null
     */
    void process() {
        // Add velocity
        pos.add(vel);

        // Create trail
        trails.add(new Trail(pos, vel, 64, (int)dim.x, #00a0f0));                                  //make 64 var trail lenght, do also for missiles

        // Detect missile collision
        boolean hit = false;
        for (Missile m : missiles) {
            if (pos.dist(m.pos)<(dim.x+m.dim.x)/2) {
                hit = true;
                break;
            }
        }

        // Trigger explosion if reach target or hit missile
        if (pos.dist(aim)<velocity || hit) {
            // Numbers should be replaces with upgradable values
            explosions.add(new Explosion(pos, 64, 32, true));
            exist=false;
        }
    }


    /**
     * Purpose:  displays Shell
     * Args:  Null
     * Returns:  Null
     */
    void display() {
        //display shell
        strokeWeight(2);
        stroke(0);
        fill(80, 180, 80);
        ellipse(pos.x, pos.y, dim.x, dim.y);
        
        //display target
        displayCrossHair(aim, Cursor_Size/2, 180, 60, 60);                                              //final vars?
    }
}
