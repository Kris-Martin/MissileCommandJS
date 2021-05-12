//Purpose: 
class StarField {
    Star[] stars = new Star[400];


    /**
     * Purpose:  TODO: fill in.
     * Args:
     * Return:
     */
    StarField() {
        load();                //dont have a function call to another function, just call 'load()' to begin with. or move statements in load to StarField
    }


    /**
     * Purpose:  TODO: fill in.
     * Args:  Null
     * Return:  Null
     */
    void load() {
        for (int i = 0; i < stars.length; i++)
            stars[i] = new Star();
    }


    /**
     * Purpose: TODO: Fill in
     * Args:  Null
     * Returns:  Null
     */
    void draw() {
        translate(0.5*width, 0.5*height);
        // Update and draw all stars
        for (int i=0; i<stars.length; i++) {
            stars[i].update();
            stars[i].show();
        }
    }
}
