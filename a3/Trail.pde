// Purpose: The trails that follow missiles and shells.
class Trail {
    boolean exist;
    int time, duration;
    int size;
    PVector pos = new PVector();
    PVector pre = new PVector();
    color col;


    /**
     * Purpose:  Trail constructor
     * Args:  PVector position, PVector previous, int lifeTime, int trailWidth,
     * color colour.
     * Returns:  Null
     */
    Trail(PVector position, PVector previous, int lifeTime, int trailWidth, color colour) {
        exist = true;
        pos.set(position);
        pre.set(previous);
        size = trailWidth;
        duration = lifeTime;
        col = colour;
    }


    /**
     * Purpose:  Processes Trail.
     * Args: Null
     * Returns: Null
     */
    void process() {
        time++;
        if (time>duration) {
            exist = false;
        }
    }


    /**
     * Purpose: Displays Trail.
     * Args: Null
     * Returns: Null
     */
    void display() {
        strokeWeight(size);
        stroke(col, 256-time*(256/duration));
        line(pos.x, pos.y, pos.x-pre.x, pos.y-pre.y);
    }
}
