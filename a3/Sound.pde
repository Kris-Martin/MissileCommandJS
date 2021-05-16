// Purpose:  A class to manage sound effects and theme music.
import processing.sound.*;


class Sound {

    SoundFile
        shatterShotExplosion,
        laserWeapon,
        menuMusic,
        drumHit,
        theme,
        music,
        annihilation;


    /**
     * Purpose:  Constructor for Sound class. Loads sound files.
     * Args:  PApplet p : must pass in main Applet for sound to work.
     * Returns:  Null
     */
    Sound(PApplet p) {
        loadFiles(p);
    }


    /**
     * Purpose:  Loads sound files, called in construtor.
     * Used to keep things neat and readable.
     * Args:  PApplet p : must pass in main Applet for sound to work.
     * Returns:  Null
     */
    void loadFiles(PApplet p) {
        // All sounds sourced from https://mixkit.co/free-sound-effects/
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

        annihilation = new SoundFile(
            p, "sound/mixkit-trailer-screaming-people-annihilation-351.wav");
    }


    /**
     * Purpose: Checks what is currently playing and assigns to music.
     * Used in menu fucntions for volume control.
     * Args:  Null
     * Returns: SoundFile music.
     */
    SoundFile currentlyPlaying() {

        if (menuMusic.isPlaying()) {
            music = menuMusic;
        }

        if (theme.isPlaying()) {
            music = theme;
        }

        return music;
    }


    /**
     * Purpose: Switches between menuMusic and theme based on gameState.
     * Args:  Null
     * Returns:  Null
     */
    void playTheme() {
        // If in main menu play menu music.
        if (gameState == 0) {
            theme.stop();
            if (!menuMusic.isPlaying()) {
                menuMusic.loop();
            }
        }
        // If in-game, play main theme.
        if (gameState == 1) {
            menuMusic.stop();
            if (!theme.isPlaying()) {
                theme.loop();
            }
        }
    }
}
