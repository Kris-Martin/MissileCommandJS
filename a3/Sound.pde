import processing.sound.*;
/**
 * Purpose:  A class to manage sound effects and theme music
 * Properties: TODO: fill in
 */
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
        fastRocketWhoosh, 
        intro,
        inGame;

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

        intro = new SoundFile(
            p, "sound/intro_trim.wav");
        
         inGame = new SoundFile(
            p, "sound/beethoven_trim.mp3");
            
    }
}
