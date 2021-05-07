import processing.sound.*;
/**
 * Purpose:  A class to manage sound effects and theme music
 * Properties: TODO: fill in
 */
class Sound {

    SoundFile shatterShotExplosion, laserWeapon, intro, drumHit, theme, music;

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

        drumHit = new SoundFile(
            p, "sound/mixkit-cinematic-mystery-trailer-drum-hit-546.mp3");

        theme = new SoundFile(
            p, "sound/theme.mp3");
    }

    void playTheme() {
        // TODO: Fix switching of music/theme
        if (gameState == 1) {
            music = intro;
        } else {
            music = theme;
        }

        music.loop();
    }
}
