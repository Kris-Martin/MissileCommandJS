/**
 * Program:     Missile Command - COSC101 Assignment 3
 * Authors:     Simon Colman, Nathan Hall, Kris Martin - Group 16
 * Version:     1.0
 * Date:        TODO: Update when ready to submit
 *
 * Usage: 
 * TODO: Fill in usage
 * 
 * Requirements: 
 * This program needs Processing and the Processing Sound library installed to 
 * function.
 *
 * Installation:
 * 1) If you have not already installed Processing on your computer please 
 * follow the instructions on https://processing.org/download/ to install it.
 * 2) Then install the sound library following the instructions from 
 * https://processing.org/reference/libraries/.
 * 3) Once Processing is installed simply download the a3 zip folder, unzip it, 
 * double click the file a3.pde which will open in processing, then click play.
 */


/**
 * Notes...
 * setLevel() takes level to generate starting values for things
 *
 * Should cities be reset as of current, or persist? functionally
 *
 * Missiles grow larger, faster, more numerous and ultimately more varied as  
 * levels increase.
 *
 * Level end should 'freeze' and calculate remaining munnitions before moving to
 *
 * TODOs...
 * TODO: Add in score modifier for distance from width/2 or diff calculation 
 * for diffulculty to hit.
 *
 * TODO: Multiple city pic varients, mainly to display health, more health 
 * steps, the better, from full city to pure rubble.
 *
 * TODO: GameMenu - class and methods
 *
 * TODO: Please fix fonts for other game text
 *
 * TODO: Complete comments and make sure all lines are >= 80 char
 *
 * TODO: Video reflection
 */


/**
 * Which game state (screen)
 * 0 = Main menu, 1 = inGame, 10 = upgrade menu, -1 = game over.
 */
int gameState;

// Points is just total score minus spent on upgrades. Like money
int score, points;  // Score array to track each level?

// Level number and time in level. Used for difficulty/spawn rates
int level, time;

// Number of starting shells and total missiles, per wave
int shellCount, missileCount, missileMax, spawnRate;
int waveCount, waveMax, waveTime, waveDuration;  // Reconfigure level/waves?

// Mouse/Cursor as vector
PVector mousePos = new PVector();

// Cursor size
final int Cursor_Size = 12;

// ArrayLists for various numerous objects
ArrayList<City> cities;
ArrayList<Shell> shells;
ArrayList<Missile> missiles;
ArrayList<Explosion> explosions;
ArrayList<Trail> trails;

// Player as cannon object. No need for array
Cannon player;

// Resources
Image image;
Sound sound;
HScrollbar volumeBarMusic;


/**
 * Purpose: Initialtes all starting parameters
 * Arguments: Null
 * Returns: Null
 */
void setup() {
    size(1024, 768);
    frameRate(60);

    gameState = 0;

    image = new Image();
    sound = new Sound(this);
    volumeBarMusic = new HScrollbar(0, height / 2 - 8, width, 16, 16);

    // Play theme music on loop
    sound.playTheme();

    level = 1;
    setLevel(); //clears and reinitiallisers ArrayLists etc
}


/**
 * Purpose: Simply seperates/branches code for ease of use
 * Arguments: Null
 * Returns: Null
 */
void draw() {

    // TODO: Investigate switching music 
    /**
     * Directs to the main functions process and display. Functions further 
     * branch from there
     */
    switch (gameState) {
    case 0:  // New game
        displayMainMenu();
        break;
    case 2:  // Options, exit
        displayOptionsMenu();
        break;    
    case 1:  // Playing
        processGame();
        displayGame();
        break;
    case 3:
        displayPauseMenu();
        break;
    case 10:  // Upgrades between levels
        //processGameMenu();
        displayLevelMenu();
        break;
    case -1:  // Game over screen
        //processGameOver();
        displayGameOver();
        break;
    }
}
