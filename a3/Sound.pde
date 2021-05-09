import processing.sound.*;


// Purpose:  A class to manage sound effects and theme music.
// All sounds sourced from https://mixkit.co/free-sound-effects/
class Sound {

    SoundFile shatterShotExplosion, laserWeapon, menuMusic, drumHit, theme, music;

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

        menuMusic = new SoundFile(
            p, "sound/mixkit-tribal-ritual-drums-567.wav");

        drumHit = new SoundFile(
            p, "sound/mixkit-cinematic-mystery-trailer-drum-hit-546.wav");

        theme = new SoundFile(
            p, "sound/theme.wav");
    }

    
    /**
     * Purpose:  TODO: fill in
     * Args:
     * Returns:
     */
    void playTheme() {
        // TODO: Fix switching of music/theme
        if (gameState == 1) {
            music = menuMusic;
        } else {
            music = theme;
        }

        music.loop();
    }
}
