// Purpose: TODO: fill in
class HScrollbar {
    int w, h;    // width and height of bar
    float xPos, yPos;       // x and y position of bar
    float sliderXPos, newSliderXPos;    // x position of slider
    float sliderXPosMin, sliderXPosMax; // max and min values of slider
    int loose;              // how loose/heavy
    boolean mouseOver;           // is the mouse mouseOver the slider?
    boolean locked;
    float ratio;


    /**
    * Purpose:  TODO: fill in.
    * Args:
    * Return:
    */
    // Improve variable names, especially in function calls, so we now what its doing. add function headers pls also
    // volumeBarMusic = new HScrollbar(0, height / 2 - 8, width, 16, 16);
    HScrollbar() {

        w = width;
        h = 16;

        int widthtoheight = width - h;

        ratio = (float)width / (float)widthtoheight;

        xPos = 0;
        yPos = (height / 2 - 8) - h / 2;

        sliderXPos = xPos + w / 2 - h / 2;
        newSliderXPos = sliderXPos;

        sliderXPosMin = xPos;
        sliderXPosMax = xPos + w - h;

        loose = 16;
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
        if (mouseOverEvent()) {
            mouseOver = true;
        } else {
            mouseOver = false;
        }
        if (mousePressed && mouseOver) {
            locked = true;
        }
        if (!mousePressed) {
            locked = false;
        }
        if (locked) {
            newSliderXPos = constrain(mouseX - h / 2, sliderXPosMin, sliderXPosMax);
        }
        if (abs(newSliderXPos - sliderXPos) > 1) {
            sliderXPos = sliderXPos + (newSliderXPos - sliderXPos) / loose;
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
    boolean mouseOverEvent() {
        return(mouseX > xPos && mouseX < xPos + w &&
            mouseY > yPos && mouseY < yPos + h);
    }


    /**
    * Purpose:  TODO: fill in
    * Args:
    * Returns:
    */
    void display() {
        noStroke();
        fill(204);
        rect(xPos, yPos, w, h);
        if (mouseOver || locked) {
            fill(0, 0, 0);
        } else {
            fill(102, 102, 102);
        }
        rect(sliderXPos, yPos, h, h);
    }


    /**
    * Purpose:  TODO: fill in
    * Args:
    * Returns:
    */
    float getPos() {
        return sliderXPos * ratio;
    }
}
