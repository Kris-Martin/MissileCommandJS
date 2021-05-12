import processing.sound.*;


// Purpose:  A class to manage sound effects and theme music.
// All sounds sourced from https://mixkit.co/free-sound-effects/
class Sound {
    SoundFile shatterShotExplosion, laserWeapon, menuMusic, drumHit, theme, music;


    /**
     * Purpose:  TODO: fill in
     * Args:  PApplet p : explenation?
     * Returns:  Null
     */
    Sound(PApplet p) {
        loadFiles(p);
    }


    /**
     * Purpose:  TODO: fill in
     * Args:  PApplet p : explenation?
     * Returns:  Null
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
     * Purpose: Checks what is currently playing and assigns to music.
     * Used in menu fucntions for volume control.
     * Args:  Null
     * Returns: SoundFile music.
     */
    SoundFile currentlyPlaying() {

        if (sound.menuMusic.isPlaying()) {
            sound.music = sound.menuMusic;
        }

        if (sound.theme.isPlaying()) {
            sound.music = sound.theme;
        }

        return sound.music;
    }


    /**
     * Purpose: Switches between menuMusic and theme based on gameState.
     * Args:  Null
     * Returns:  Null
     */
    void playTheme() {
        if (gameState == 0) {
            sound.theme.stop();
            if (!sound.menuMusic.isPlaying()) {
                sound.menuMusic.loop();
            }
        }
        // TODO: Fix switching of music/theme
        if (gameState == 1) {
            sound.menuMusic.stop();
            if (!sound.theme.isPlaying()) {
                sound.theme.loop();
            }
        }
    }
}
