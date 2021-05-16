// Purpose: A class for displaying scroll bar.
// A scroll bar class provided by the processing reference.
// https://processing.org/examples/scrollbar.html

class HScrollbar {

    // Width and height of bar.
    int scrollBarWidth = width/2;
    int scrollBarHeight = 16;

    // X and Y position of bar.
    float xpos = width/4;
    float ypos = (height/2 - 8) - scrollBarHeight/2;

    // Max and min values of slider.
    float scrollBarMin = xpos;
    float scrollBarMax = xpos + scrollBarWidth - scrollBarHeight;

    // X position of slider.
    float scrollBarPos = xpos + scrollBarWidth/2;
    // newPos is used to store the updated position from user.
    float newPos = scrollBarPos;

    // How loose/heavy.
    int loose = 16;

    // Is the mouse over the slider?
    boolean over;
    boolean locked;
    float ratio;


    /**
     * Purpose: Scrollbar constructor function.
     * Args:2 floats and 3 integers
     * Return: Null
     */
    HScrollbar () {

        int widthtoheight = scrollBarWidth - scrollBarHeight;
        ratio = (float)scrollBarWidth/(float)widthtoheight;
    }


    /**
     * Purpose:  Draws the scroll bar.
     * Args: Null
     * Return: Null
     */
    void draw() {
        update();
        display();
    }


    /**
     * Purpose:  Updates the scroll bar position based on user.
     * Args: Null
     * Returns: Null
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
            newPos = constrain(mouseX, scrollBarMin, scrollBarMax);
        }
        if (newPos != scrollBarPos) {
            scrollBarPos = scrollBarPos + (newPos-scrollBarPos)/loose;
        }
    }


    /**
     * Purpose:  limits the value represented by the x positions
     * and assists in mapping the value of the scroll bar to the volume.
     * Args: 3 floats
     * Returns: function
     */
    float constrain(float val, float minv, float maxv) {
        return min(max(val, minv), maxv);
    }


    /**
     * Purpose: Activates the scroll feature so the scroll bar moves.
     * Args: Null
     * Returns: boolean
     */
    boolean overEvent() {
        return (mouseX > xpos && mouseX < xpos+scrollBarWidth &&
                mouseY > ypos && mouseY < ypos+scrollBarHeight);
    }


    /**
     * Purpose: Displays the scroll bar.
     * Args: Null
     * Returns: Null
     */
    void display() {
        noStroke();
        fill(204);
        rect(xpos, ypos, scrollBarWidth, scrollBarHeight);
        if (over || locked) {
            fill(0, 0, 0);
        } else {
            fill(102, 102, 102);
        }
        rect(scrollBarPos, ypos, scrollBarHeight, scrollBarHeight);
    }


    /**
     * Purpose: A function which returns the position of the scroll bar.
     * Args: Null
     * Returns: float
     */
    float getPos() {

        return scrollBarPos * ratio;
    }


    /**
     * Purpose: To map the position the amplitude of the background music
     * with the scroll bar.
     * Args: none
     * Return: none
    */
    void changeVolume() {
        float scrollBarPosition = getPos();

        float minVolume = 0.001;
        float maxVolume = 1.0;

        float volume = map(
            scrollBarPosition, xpos, scrollBarWidth, minVolume, maxVolume);

        // Slider starts at scrollBar midpoint, volume value adjusted to match.
        volume /= 2;

        // Rounds value to 1
        if (volume > maxVolume) {
            volume = maxVolume;
        // Any value under 0.02 becomes inaudible without triggering sound library warning.
        // A value of 0 woud trigger a repeating warning message.
        } else if (volume < 0.02) {
            volume = minVolume;
        }

        sound.music = sound.currentlyPlaying();
        sound.music.amp(volume);
        sound.theme.amp(volume);
    }

}
