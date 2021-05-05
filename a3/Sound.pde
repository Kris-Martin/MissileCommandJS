import processing.sound.*;
/**
 * Purpose:  A class to manage sound effects and theme music
 * Properties: TODO: fill in
 */
class Sound {

<<<<<<< HEAD
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
        fastRocketWhoosh, 
        intro,
        inGame;
=======
    SoundFile shatterShotExplosion, laserWeapon, intro;
>>>>>>> e32402305016eec3cd57c616ec3ec77e14e20a27

    /**
     * Purpose:  TODO: fill in
     * Args:
     * Returns:
     */
    Sound(PApplet p) {

        loadFiles(p);
    }

    /**
     * Purpose:  TODO: fill in
     * Args:
     * Returns:
     */
    void loadFiles(PApplet p) {

        shatterShotExplosion = new SoundFile(
            p, "sound/mixkit-shatter-shot-explosion-1693.wav");

        laserWeapon = new SoundFile(
            p, "sound/mixkit-laser-weapon-shot-1681.wav");

        intro = new SoundFile(
            p, "sound/intro_trim.wav");
        
         inGame = new SoundFile(
            p, "sound/beethoven_trim.mp3");
            
    }
}
