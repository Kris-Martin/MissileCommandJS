/*
  Assignment 3 Group Project: Arcade Missile defence
  By Group 16 - Nathan Hall, Kris Martin, Simon Colman
*/



/*
Notes:
while mouse is pressed, and reload = 100%, spawn new shell, aimed at mouse, it stores the mousePos vector and displays its own crosshair
at some point work out rotation for the turret
change boolean state to more complete, start menu with settings, in game(level), between level upgrade selection, game over screen with option to return to menu
*/



//which game state/screen
boolean inMenu;
//points is just total score minus spent on upgrades. kinda like money
int score, points;
//level number and time in level. Used for difficulty/spawn rates
int level, time;
//Mouse/Cursor as vector
PVector mousePos = new PVector();
int cursorSize;

//ArrayLists for various numerous objects
ArrayList<city> cities;
ArrayList<shell> shells;
ArrayList<missile> missiles;

//player as cannon object. no need for array
cannon player;

//resources
PImage city1;
PImage cannonBase;
PImage cannonWheel;
PImage cannonBarrel;

//Default Object Values
int cityDefaultHealth=100;



/*
Purpose: Initialtes all starting parameters
Arguments: Null
Returns: Null
*/
void setup(){
  size(1024,768);
  frameRate(60); //specific so counters are consistant
  inMenu = false;
  score = 0;
  points = 0;
  level = 0; //count like array?
  time = 0;
  
  cursorSize = 12;
  
  loadResources();
  setLevel(); //clears and reinitiallisers ArrayLists etc
}



/*
Purpose: Loads Image Objects
Arguments: Null
Returns: Null
*/
void loadResources(){
  city1 = loadImage("images/city1.png");
  cannonBase = loadImage("images/cannonBase.png");
  cannonWheel = loadImage("images/cannonWheel.png");
  cannonBarrel = loadImage("images/cannonBarrel.png");
}



/*
Purpose: Simply seperates/branches code for ease of use
Arguments: Null
Returns: Null
*/
void draw(){
  //draw just redirects to the main states process and display. functions branch from there
  if (inMenu){
    processMenu();
    displayMenu();
  }
  else{
    processGame();
    displayGame();
  }
}
