//final var

//which game state/screen
boolean inMenu;
//points is just total score minus spent on upgrades
int score, points;
//level number and time in level. Used for difficulty/spawn rates
int level, time;

//ArrayLists for various numerous objects
ArrayList<city> cities;
ArrayList<shell> shells;
ArrayList<missile> missiles;

//    Default object var
//cannon
PVector cannonDim = new PVector();
PVector barrelDim = new PVector();
PVector barrelAim = new PVector();

//city
int cityDefaultHealth;
PVector cityDim = new PVector();
//shell
//missile
  

//resources
PImage city1;


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
  
  loadResources();
  setDefaultObjectVariables();
  setLevel(); //clears and reinitiallisers ArrayLists etc
}


void loadResources(){
  city1 = loadImage("city1.png");
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


void setDefaultObjectVariables(){
  //Player/Cannon
  cannonDim.x = 60;
  cannonDim.y = 60;
  barrelDim.x = 60;
  barrelDim.y = 10; //these values may alter as player upgrades
  
  //City
  cityDefaultHealth = 100;
  cityDim.x = 60;
  cityDim.y = 40;

  //Shells
  
  //Missiles
}
