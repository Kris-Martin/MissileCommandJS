class StarField {
    Star[] stars = new Star[400];
    
    /**
     * Purpose:  TODO: fill in.
     * Properties:
     * Return: 
     */
    StarField() {
        load();
    }


    /**
     * Purpose:  TODO: fill in.
     * Properties:
     * Return: 
     */
    void load() {
        for (int i = 0; i < stars.length; i++) 
            stars[i] = new Star();
    }


    /**
     * Purpose: TODO: Fill in
     * Arguments: 
     * Returns: 
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
