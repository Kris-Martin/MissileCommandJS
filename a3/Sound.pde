// A class to manage sound effects and theme music
import processing.sound.*;

class Sound {
    
    SoundFile 
        shortLaser, 
        laserCannon, 
        plasmaGunPowerUp, 
        plasmaGunPower,
        battleLaserShots,
        shatterShotExplosion,
        massiveExplosion,
        laserWeapon, 
        bombDropImpact,
        fastRocketWhoosh;
    
    Sound(PApplet p) {
        
        loadFiles(p);
            
    }
    
    void loadFiles(PApplet p) {

        shortLaser = new SoundFile(
            p, "sound/mixkit-short-laser-gun-shot-1670.wav" );
            
        laserCannon = new SoundFile(
            p, "sound/mixkit-laser-cannon-shot-1678.wav");
            
        plasmaGunPowerUp = new SoundFile(
            p, "sound/mixkit-sci-fi-plasma-gun-power-up-1679.wav");
            
        plasmaGunPower = new SoundFile(
            p, "sound/mixkit-sci-fi-plasma-gun-power-1680.wav");
            
        battleLaserShots = new SoundFile(
            p, "sound/mixkit-sci-fi-battle-laser-shots-2783.wav");
            
        shatterShotExplosion = new SoundFile(
            p, "sound/mixkit-shatter-shot-explosion-1693.wav");
            
        massiveExplosion = new SoundFile(
            p, "sound/mixkit-masive-explosion-in-battle-2777.wav");
            
        laserWeapon = new SoundFile(
            p, "sound/mixkit-laser-weapon-shot-1681.wav");
            
        bombDropImpact = new SoundFile(
            p, "sound/mixkit-bomb-drop-impact-2804.wav");
            
        fastRocketWhoosh = new SoundFile(
            p, "sound/mixkit-fast-rocket-whoosh-1714.wav");
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
             if (key == '0') {
                 fastRocketWhoosh.play();
             }
         }  
    }
}
