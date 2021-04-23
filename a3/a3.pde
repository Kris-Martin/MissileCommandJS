/*
  Assignment 3 Group Project: Arcade Missile defence
  By Group 16 - Nathan Hall, Kris Martin, Simon Colman
*/



/*
Notes / TODO:
setLevel() takes level to generate starting values for things
add in score modifier for distance from width/2 or diff calculation for diffulculty to hit
multiple city pic varients, mainly to display health, more health steps, the better, from full city to pure rubble
should cities be reset as of current, or persist? functionally
Missiles grow larger, faster, more numerous and ultimately more varied as levels increase.
Level end should 'freeze' and calculate remaining munnitions before moving to GameMenu
Please fix fonts for other game text
*/



//which game state/screen
//0 = Main menu, 1 = inGame, 10 = upgrade menu, -1 = game over.
int gameState;

//points is just total score minus spent on upgrades. kinda like money
int score, points;  //score array to track each level?

//level number and time in level. Used for difficulty/spawn rates
int level, time;

//number of, starting shells and total missiles, per wave
int shellCount, missileCount, missileMax;
int spawnRate;

//Mouse/Cursor as vector
PVector mousePos = new PVector();

//cursor size
final int Cursor_Size = 12;

//ArrayLists for various numerous objects
ArrayList<City> cities;
ArrayList<Shell> shells;
ArrayList<Missile> missiles;
ArrayList<Explosion> explosions;
ArrayList<Trail> trails;

//player as cannon object. no need for array
Cannon player;

//resources
Image image;
Sound sound;

/*
Purpose: Initialtes all starting parameters
Arguments: Null
Returns: Null
*/
void setup(){
  size(1024,768);
  frameRate(60);
  
  gameState = 0;
  
  image = new Image();
  sound = new Sound(this);
  
  level = 1;
  setLevel(); //clears and reinitiallisers ArrayLists etc
}


/*
Purpose: Simply seperates/branches code for ease of use
Arguments: Null
Returns: Null
*/
void draw(){
  //draw just redirects to the main states process and display. functions branch from there
  switch (gameState){
    case 0:  //new game
      processMainMenu();
      displayMainMenu();
      break;
    case 2:  //options,exit
      processPauseMenu();
      displayPauseMenu();
      break;
    case 1:  //playing
      processGame();
      displayGame();
      break;
    case 10:  //upgrades between levels
      processGameMenu();
      displayGameMenu();
      break;
    case -1:  //game over screen
      processGameOver();
      displayGameOver();
      break;
  }
}
