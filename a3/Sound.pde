// A class to manage sound effects and theme music
import processing.sound.*;

class Sound {
    
    private SoundFile shortLaserShot;
    private SoundFile laserCannon;
    private SoundFile plasmaGunPowerUp;
    private SoundFile plasmaGunPower;
    private SoundFile battleLaserShots;
    private SoundFile shatterShotExplosion;
    private SoundFile massiveExplosion;
    private SoundFile laserWeapon;
    private SoundFile bombDropImpact;
    
    
    Sound(PApplet p) {
        
        shortLaserShot = new SoundFile(
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
    
    void shortLaser() {
        
        shortLaserShot.play();
    }
    
    void laserCannon() {
        
        laserCannon.play();
    }
    
    void plasmaGunPowerUp() {
        
        plasmaGunPowerUp.play();
    }
    
    void plasmaGunPower() {
    
        plasmaGunPower.play();
    }
    
    void battleLaserShots() {
    
        battleLaserShots.play();
    }
    
    void shatterShotExplosion() {
        
        shatterShotExplosion.play();
    }
    
    void massiveExplosion() {
    
        massiveExplosion.play();
    }
    
    void laserWeapon() {
    
        laserWeapon.play();
    }
    
    void bombDropImpact() {
        
        bombDropImpact.play();
    }
    
    void test() {
        if (keyPressed) {
        
            if (key == '1') {
                shortLaser();
            }
            if (key == '2') {
                laserCannon();
            }
            if (key == '3') {
                laserWeapon();
            }
            if (key == '4') {
                plasmaGunPowerUp();
            }
            if (key == '5') {
                plasmaGunPower();
            }
            if (key == '6') {
                battleLaserShots();
            }
            if (key == '7') {
                shatterShotExplosion();
            }
            if (key == '8') {
                massiveExplosion();
            }
            if (key == '9') {
                bombDropImpact();
            }
       
        }  
    }
}
