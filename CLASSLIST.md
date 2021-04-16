# List of Classes

### a3:
Main program, contains global variables, setup, draw and loadResources methods.

### Cannon:

Players defence/canon that fires shells.

### City:

City object, fields include health, position and dimensions.

### displayGame:

Game display class, includes levelBackground, displayCrossHair, and displayScore methods.
Central loop that calls all Obj.display() methods

### displayMenu:

Display game menu.
Not yet implemented, and may alter how menu's work

### Missile:

Enemy ammunition. Includes position, velocity and dimensions.

### processGame:

Main game loop. Controls game assets.

### processMenu:

Main Menu loop, controls menu and I/O

### setLevel:

Initialise/reset game assets.
Call at start of each level.

### Shell:

Ammunition fired by player's cannon.

