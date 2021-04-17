// A class to manage sound effects and theme music
import processing.sound.*;

class Sound {
    
    private SoundFile shortLaser;
    private SoundFile laserCannon;
    private SoundFile plasmaGunPowerUp;
    private SoundFile plasmaGunPower;
    private SoundFile battleLaserShots;
    private SoundFile shatterShotExplosion;
    private SoundFile massiveExplosion;
    private SoundFile laserWeapon;
    private SoundFile bombDropImpact;
    
    
    Sound(PApplet p) {
        
        loadFiles(p);
            
    }
    
    void loadFiles(PApplet p) {

        shortLaser = new SoundFile(
            p, "mixkit-short-laser-gun-shot-1670.wav" );
            
        laserCannon = new SoundFile(
            p, "mixkit-laser-cannon-shot-1678.wav");
            
        plasmaGunPowerUp = new SoundFile(
            p, "mixkit-sci-fi-plasma-gun-power-up-1679.wav");
            
        plasmaGunPower = new SoundFile(
            p, "mixkit-sci-fi-plasma-gun-power-1680.wav");
            
        battleLaserShots = new SoundFile(
            p, "mixkit-sci-fi-battle-laser-shots-2783.wav");
            
        shatterShotExplosion = new SoundFile(
            p, "mixkit-shatter-shot-explosion-1693.wav");
            
        massiveExplosion = new SoundFile(
            p, "mixkit-masive-explosion-in-battle-2777.wav");
            
        laserWeapon = new SoundFile(
            p, "mixkit-laser-weapon-shot-1681.wav");
            
        bombDropImpact = new SoundFile(
            p, "mixkit-bomb-drop-impact-2804.wav");
    }
    
    void test() {

         if (keyPressed) {
        
             if (key == '1') {
                 shortLaser.play();
             }
             if (key == '2') {
                 laserCannon.play();
             }
             if (key == '3') {
                 laserWeapon.play();
             }
             if (key == '4') {
                 plasmaGunPowerUp.play();
             }
             if (key == '5') {
                 plasmaGunPower.play();
             }
             if (key == '6') {
                 battleLaserShots.play();
             }
             if (key == '7') {
                 shatterShotExplosion.play();
             }
             if (key == '8') {
                 massiveExplosion.play();
             }
             if (key == '9') {
                 bombDropImpact.play();
             }
         }  
    }
}
