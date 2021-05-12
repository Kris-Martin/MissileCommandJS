// Purpose: TODO: fill in
class HScrollbar {
    int swidth, sheight;    // width and height of bar
    float xpos, ypos;       // x and y position of bar
    float spos, newspos;    // x position of slider
    float sposMin, sposMax; // max and min values of slider
    int loose;              // how loose/heavy
    boolean over;           // is the mouse over the slider?
    boolean locked;
    float ratio;


    /**
     * Purpose:  TODO: fill in.
     * Args:
     * Return:
     */
     // Improve variable names, especially in function calls, so we now what its doing. add function headers pls also
    HScrollbar (float xp, float yp, int sw, int sh, int l) {
        swidth = sw;
        sheight = sh;
        int widthtoheight = sw - sh;
        ratio = (float)sw / (float)widthtoheight;
        xpos = xp;
        ypos = yp-sheight/2;
        spos = xpos + swidth/2 - sheight/2;
        newspos = spos;
        sposMin = xpos;
        sposMax = xpos + swidth - sheight;
        loose = l;
    }


    /**
     * Purpose:  TODO: fill in.
     * Args:
     * Return:
     */
    void draw() {
        update();
        display();
    }


    /**
     * Purpose:  TODO: fill in
     * Args:
     * Returns:
     */
    void update() {
        if (overEvent()) {
            over = true;
        } else {
            over = false;
        }
        if (mousePressed && over) {
            locked = true;
        }
        if (!mousePressed) {
            locked = false;
        }
        if (locked) {
            newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
        }
        if (abs(newspos - spos) > 1) {
            spos = spos + (newspos-spos)/loose;
        }
    }


    /**
     * Purpose:  TODO: fill in
     * Args:
     * Returns:
     */
    float constrain(float val, float minv, float maxv) {
        return min(max(val, minv), maxv);
    }


    /**
     * Purpose:  TODO: fill in
     * Args:
     * Returns:
     */
    boolean overEvent() {
        return (mouseX > xpos && mouseX < xpos+swidth &&
            mouseY > ypos && mouseY < ypos+sheight);
    }


    /**
     * Purpose:  TODO: fill in
     * Args:
     * Returns:
     */
    void display() {
        noStroke();
        fill(204);
        rect(xpos, ypos, swidth, sheight);
        if (over || locked) {
            fill(0, 0, 0);
        } else {
            fill(102, 102, 102);
        }
        rect(spos, ypos, sheight, sheight);
    }


    /**
     * Purpose:  TODO: fill in
     * Args:
     * Returns:
     */
    float getPos() {
        return spos * ratio;
    }
}
