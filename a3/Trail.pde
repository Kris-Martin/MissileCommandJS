/*
Purpose: The trails that follow missiles and shells
 */
class Trail {
    boolean exist;
    int time, duration;
    int size;
    PVector pos = new PVector();
    PVector pre = new PVector();
    color col;

    Trail(PVector position, PVector previous, int lifeTime, int trailWidth, color colour) {
        exist = true;
        pos.set(position);
        pre.set(previous);
        size = trailWidth;
        duration = lifeTime;
        col = colour;
    }



    /*
Purpose: Initialtes all starting parameters
     Arguments: Null
     Returns: Null
     */
    void process() {
        time++;
        if (time>duration) {
            exist = false;
        }
    }



    /*
Purpose: Initialtes all starting parameters
     Arguments: Null
     Returns: Null
     */
    void display() {
        strokeWeight(size);
        stroke(col, 256-time*(256/duration));
        line(pos.x, pos.y, pos.x-pre.x, pos.y-pre.y);
    }
}
