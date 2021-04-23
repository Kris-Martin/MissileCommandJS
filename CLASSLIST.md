# List of Classes / seperate files

## Central Script - a3:
Main program, contains global variables, setup, draw and loadResources methods.

## Classes:

### Cannon:

Players defence/canon that fires shells.

### City:

City object, fields include health, position and dimensions.

### Missile:

Enemy ammunition. Includes position, velocity and dimensions.

### Images

A class to mange images and graphics

### Shell:

Ammunition fired by player's cannon.

### Sound:

A class to manage sound effects and theme music.

### Trail:

A class to manage the missile trails.

## Seperate files - Functions or function groupings

### processGame:

Main game loop. Controls game assets.

### processMenu:

Main Menu loop, controls menu and I/O

### displayGame:

Game display class, includes levelBackground, displayCrossHair, and displayScore methods.
Central loop that calls all Obj.display() methods

### displayMenu:

Display game menu.
Not yet implemented, and may alter how menu's work

### setLevel:

Initialise/reset game assets.
Call at start of each level.

