/**
 * Program:     Missile Command - COSC101 Assignment 3
 * Authors:     Simon Colman, Nathan Hall, Kris Martin - Group 16
 * Version:     1.0
 * Date:        17/05/2021
 * Video:       Video Summary: https://www.youtube.com/watch?v=Vv0a_A2lXO4 
 *
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
 *
 * Usage:
 * Open a3.pde and click the processing play button to start program. You will
 * be presented with the main menu screen. Click options to adjust music volume
 * for both game and menu music, or click start game to play. After starting the
 * game you can pause by hitting space, and a pause menu will appear - you can 
 * then choose to return to the game or quit the game by returning to the main 
 * menu.

 * When the game starts you have 6 cities to defend and one missile defence
 * system/cannon to defend them with. Move the mouse to aim the cannon and
 * click to shoot. Enemy missiles will rain down in waves from the top of the
 * screen. It is your job to block as many missiles as you can with your
 * cannon. Aim your shot to intersect with the missile’s trajectory and the
 * missile will be destroyed. Miss and if the missile hits a city, the city
 * will take damage. Once a city has taken too much damage it will be
 * destroyed.
 *
 * The game is over when all six cities have been destroyed. Good luck!
 */


// Which game state (screen)
int gameState;

//Game score
int score;

// Level number and time in level. Used for difficulty/spawn rates
int level, time;

// Number of starting shells and total missiles, per wave
int shellCount, missileCount, missileMax, spawnRate;

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
Menu menu;


/**
 * Purpose: Initialises all starting parameters.
 * Args: Null
 * Returns: Null
 */
void setup() {
    size(1280, 720);
    // Set background to black for less noticable load.
    background(0);
    frameRate(60);

    gameState = 0;

    image = new Image();
    sound = new Sound(this);
    menu = new Menu();

    // Play theme music on loop
    sound.playTheme();

    // Sets and initiallisers ArrayLists, objects, etc
    newGame();
    level = 1;
    setLevel();
}


/**
 * Purpose: Simply seperates/branches code for ease of use
 * Args: Null
 * Returns: Null
 */
void draw() {

    // Used to switch music playing based on gameState.
    sound.playTheme();

    /**
     * Directs to the main functions process and display. Functions further
     * branch from there
     */
    switch (gameState) {
        case 0:  // Main menu
            menu.displayMainMenu();
            break;
        case 1:  // Playing
            processGame();
            displayGame();
            break;
        case 2:  // Options/Exit from main menu
            menu.displayOptionsMenu();
            break;
        case 3:  // Pause/Exit from in game
            menu.displayPauseMenu();
            break;
        case 10:  // A recess between levels, button to continue
            menu.displayLevelMenu();
            break;
        case -1:  // Game over screen
            displayGameOver();
            break;
    }
}
