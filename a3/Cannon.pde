/*
The players defence turret/cannon
 */
class Cannon {
    PVector baseDim = new PVector();
    PVector basePos = new PVector();

    PVector wheelDim = new PVector();

    PVector barrelDim = new PVector();
    PVector barrelPos = new PVector();

    PVector reloadDim = new PVector();
    int reloadPeriod;
    int reloadTime;



    /*
  Purpose: Cannon constructor
     Arguments: Null
     Returns: Null
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
        barrelPos.y = height-baseDim.y;

        reloadDim.x = 38;
        reloadDim.y = 6;   
        reloadPeriod = 32;  //128
        reloadTime = 0;
    }



    /*
  Purpose: Displays the object
     Arguments: Null
     Returns: Null
     */
    void display() {
        //change this
        //need to implement barrel rotation
        image(resource.cannonBase, basePos.x-baseDim.x/2, height-baseDim.y, baseDim.x, baseDim.y);
        
        //rotate barrel, display, then unrotate
        translate(basePos.x,height-baseDim.y);
        rotate(vectorDiff(new PVector(basePos.x,height-baseDim.y),mousePos).heading()-PI/2);
        image(resource.cannonBarrel, -barrelDim.x/2, -barrelDim.y*(5./8.), barrelDim.x, barrelDim.y);
        rotate(-vectorDiff(new PVector(basePos.x,height-baseDim.y),mousePos).heading()+PI/2);
        translate(-(basePos.x),-(height-baseDim.y));
        
        image(resource.cannonWheel, basePos.x-wheelDim.x/2, height-baseDim.y-wheelDim.y/2, wheelDim.x, wheelDim.y);
        this.reloadBar();
    }



    /*
  Purpose: Displays the reload
     Arguments: Null
     Returns: Null
     */
    void reloadBar() {
        stroke(0);
        strokeWeight(1.5);
        float reloadRatio = (float)reloadTime/reloadPeriod;
        fill(40, 40, 80);
        rect(mousePos.x-reloadDim.x/2, mousePos.y+cursorSize*2, reloadDim.x, reloadDim.y, 8);
        fill(80, 180, 240);
        if (reloadRatio==1) {
            fill(80, 240, 80);
        }
        rect(mousePos.x-reloadDim.x/2, mousePos.y+cursorSize*2, reloadRatio*reloadDim.x, reloadDim.y, 8);
    }



    /*
  Purpose: Reloads Cannon, on click: Creates and fires a new shell
     Arguments: Null
     Returns: Null
     */
    void reloadAndShoot() {
        if (reloadTime<reloadPeriod) {
            reloadTime++;
        } else if (reloadTime==reloadPeriod && mousePressed && mouseButton == LEFT) {
            reloadTime = 0;
            shells.add(new Shell(mousePos));
            sound.laserWeapon.play();
        }
    }



    /*
  Purpose: ?
     Arguments: Null
     Returns: Null
     */
}