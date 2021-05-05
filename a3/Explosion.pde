/**
 * Purpose:  Explosions triggerd by shell, they grow and shrink, destroying all 
 * they hit.
 * Properties: TODO: fill in.
 */
class Explosion {
    boolean exist;
    boolean parentIsPlayer;

    PVector pos = new PVector();
    int time, duration;
    int radius, size;
    int destroyCount, scoreAdd;


    /**
     * Purpose:  Constructor
     * Args:
     * Returns:
     */
    Explosion(PVector position, int power, int lifeTime, boolean parent) {
        exist = true;
        parentIsPlayer = parent;

        pos.set(position);

        time=0;
        duration = lifeTime;
        radius = 0;
        size = power;    
        destroyCount = 0;
        scoreAdd = 0;
        
        sound.drumHit.play();
    }


    /**
     * Purpose:  Processes object
     * Args:
     * Returns:
     */
    void process() {
        time++;
        // Radius grows and shrinks over duration.
        // TODO: Need to fix. so that duration doesnt need to match size
        radius = (int) (size -abs(duration-time)*((float)size/duration));  

        if (parentIsPlayer) {
            missileCollide();
        }
        cityCollide();

        // End explosion, add points to score
        if (time>duration*2) {
            score+= scoreAdd;
            exist=false;
        }
    }


    /**
     * Purpose:  Detect missile collision, destroy and tally destroyCount based 
     * on number destroyed
     * Args:
     * Returns:
     */
    void missileCollide() {
        for (Missile m : missiles) {
            if (pos.dist(m.pos)<(radius+m.dim.x)/2) {
                m.exist = false;
                sound.shatterShotExplosion.play();
                destroyCount++;
            }
        }
        // Score to add = count^2 + closeness to ground all time by 100
        if (destroyCount>0) {
            scoreAdd = (int)((pow(destroyCount+(float)pos.y/height, 2))*250);
        }
    }  


    /**
     * Purpose:  Displays explosion. Detect city collision, deal damage based 
     * on proximity (general% or closest discrete?).
     * Args:
     * Returns:
     */
    void cityCollide() {
        for (City c : cities) {
            float dist = pos.dist(c.pos);
            if (dist<(radius+c.dim.x)/2 && radius==size) {
                c.health -= size;
                if (c.health<0) {
                    c.health=0;
                }
            }
        }
    }  


    /**
     * Purpose:  Displays object
     * Args:
     * Returns:
     */
    void display() {
        stroke(0);
        strokeWeight(1);
        fill(240, 80, 80);
        ellipse(pos.x, pos.y, radius, radius);
        fill(80, 240, 80);
        // Display score addition
        if (destroyCount>0) {
            // Alter based on level, as you expect increasing points
            textSize(scoreAdd/(25+level));  
            text("+"+scoreAdd, pos.x+size/2, pos.y);
        }
    }
}
