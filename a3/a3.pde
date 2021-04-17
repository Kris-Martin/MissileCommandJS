/*
  Assignment 3 Group Project: Arcade Missile defence
  By Group 16 - Nathan Hall, Kris Martin, Simon Colman
*/



/*
Notes:
Yall can write here too, these are internal notes, or TODO list if you will
at some point work out rotation for the turret
setLevel() takes level to generate starting values for things
add in score modifier for distance from width/2 or diff calculation for diffulculty to hit
*/



//which game state/screen
//0 = Main menu, 1 = inGame, 10 / 2 = upgrade menu, 3 / -1 = game over.
int gameState;
//points is just total score minus spent on upgrades. kinda like money
int score, points;
//level number and time in level. Used for difficulty/spawn rates
int level, time;
//Mouse/Cursor as vector
PVector mousePos = new PVector();
int cursorSize;

//ArrayLists for various numerous objects
ArrayList<City> cities;
ArrayList<Shell> shells;
ArrayList<Missile> missiles;
ArrayList<Explosion> explosions;
ArrayList<Trail> trails;

//player as cannon object. no need for array
Cannon player;

//resources
Resources resource;
Sound sound;

//Default Object Values
int cityDefaultHealth=100;



/*
Purpose: Initialtes all starting parameters
Arguments: Null
Returns: Null
*/
public void settings() {
    size(1024,768);
}

void setup(){
  
  frameRate(60); //specific so counters are consistant
  gameState = 1;
  score = 0;
  points = 0;
  level = 1;  //so to display custom background for now
  time = 0;
  
  cursorSize = 12;
  
  resource = new Resources();
  sound = new Sound(this);
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
    case 0:
      processMainMenu();
      displayMainMenu();
      break;
    case 1:
      processGame();
      displayGame();
      break;
    case 10:
      processGameMenu();
      displayGameMenu();
      break;
    case -1:
      processGameOver();
      displayGameOver();
      break;
  }
}
