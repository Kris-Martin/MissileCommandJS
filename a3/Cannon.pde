// Purpose: Create and manage the missile defence system (cannon)
class Cannon {
    PVector baseDim = new PVector();
    PVector basePos = new PVector();

    PVector wheelDim = new PVector();

    PVector barrelDim = new PVector();
    PVector barrelPos = new PVector();

    PVector reloadDim = new PVector();
    int reloadPeriod;
    int reloadTime;


    /**
     * Purpose: Cannon constructor
     * Args: Null
     * Returns: Null
     */
    Cannon() {
        baseDim.x = 80;
        baseDim.y = 24;
        basePos.x = width/2;
        basePos.y = 0;

        wheelDim.x = 40;
        wheelDim.y = 40;

        barrelDim.x = 40;
        barrelDim.y = 80;
        barrelPos.x = basePos.x;
        barrelPos.y = height - baseDim.y;

        reloadDim.x = 40;
        reloadDim.y = 6;
        reloadPeriod = 128;  //128
        reloadTime = 0;
    }


    /**
     * Purpose: Displays the object
     * Args: Null
     * Returns: Null
     */
    void display() {
        // Display cannon base
        image(
            image.cannonBase,
            basePos.x - baseDim.x/2,
            height - baseDim.y,
            baseDim.x, baseDim.y);

        // Translate, Rotate barrel, display, then unrotate and untranslate
        translate(basePos.x, height - baseDim.y);
        rotate(vectorDiff(new PVector(
            basePos.x, height - baseDim.y), mousePos).heading() - PI/2);
        image(
            image.cannonBarrel,
            -barrelDim.x/2,
            -barrelDim.y * (5./8.),
            barrelDim.x, barrelDim.y);
        rotate( - vectorDiff(new PVector(
            basePos.x, height -baseDim.y), mousePos).heading() + PI/2);
        translate(-(basePos.x), - (height - baseDim.y));

        // Display cannon wheel
        image(
            image.cannonWheel,
            basePos.x - wheelDim.x/2,
            height - baseDim.y - wheelDim.y/2,
            wheelDim.x, wheelDim.y);

        // Display the reload bar and remaining ammo
        reloadBar();
        ammoCount();
    }


    /**
     * Purpose: Reloads Cannon, on click: Creates and fires a new shell
     * Args: Null
     * Returns: Null
     */
    void reloadAndShoot() {
        if (gameState == 1) {
            if (reloadTime < reloadPeriod) {
                reloadTime++;
            } else if (reloadTime == reloadPeriod && shellCount > 0 && mousePressed && mouseButton == LEFT) {
                reloadTime = 0;
                shellCount--;
                shells.add(new Shell(mousePos));
                sound.laserWeapon.play();
            }
        }
    }


    /**
     * Purpose: Displays the reload
     * Args: Null
     * Returns: Null
     */
    void reloadBar() {
        stroke(0);
        strokeWeight(1.5);
        fill(40, 40, 80);

        float reloadRatio = (float)reloadTime / reloadPeriod;

        rect(
            mousePos.x - reloadDim.x/2,
            mousePos.y + Cursor_Size * 2,
            reloadDim.x, reloadDim.y, 8);

        fill(80, 180, 240);

        if (reloadRatio == 1) {
            fill(80, 240, 80);
        }
        if (shellCount == 0) {
            fill(240, 80, 80);
            reloadRatio = 1;
        }

        rect(
            mousePos.x - reloadDim.x / 2,
            mousePos.y + Cursor_Size * 2,
            reloadRatio * reloadDim.x, reloadDim.y, 8);
    }


    /**
     * Purpose: Displays the shell/ammo count
     * Args: Null
     * Returns: Null
     */
    void ammoCount() {
        // Draw full lines worth of *8 ammo
        int magazineSize = 8;
        stroke(80, 240, 240);
        strokeWeight(2);
        for (int i = magazineSize; i < shellCount; i +=magazineSize) {
            line(
                mousePos.x - reloadDim.x/2,
                mousePos.y + Cursor_Size * 3 + i * 4/magazineSize,
                mousePos.x + reloadDim.x/2,
                mousePos.y + Cursor_Size * 3 + i * 4/magazineSize);
        }

        // Draw current row of ammo
        int loadedCount = shellCount % magazineSize == 0 &&
                          shellCount!= 0 ?
                          magazineSize : shellCount % magazineSize;

        float roundRatio = reloadDim.x / magazineSize;

        for (int i = 0; i < loadedCount; i++) {
            stroke(0);
            strokeWeight(1);
            fill(80, 240, 240);
            rect(
                mousePos.x - reloadDim.x/2 + i * (roundRatio),
                mousePos.y + Cursor_Size * 2.8,
                roundRatio, 4, 1);
        }
    }
}
