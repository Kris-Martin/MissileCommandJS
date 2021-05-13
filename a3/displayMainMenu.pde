/**
 * Purpose:  To keep all the logic for displaying the main menu in the one area
 * Args:  Null
 * Return:  Null
 */
void displayMainMenu() {
    background(0, 0, 16);
    
    //should you create buttons in setup, and just a matter of displaying/checking during this function?
    MenuButton startGame = new MenuButton("start game", width * 3/12, height/2);
    MenuButton options = new MenuButton("options", width * 4/12, height * 3.5/5);
    MenuButton heading = new MenuButton("Missile Command", width/2, height/4);    
        
    
    heading.headingDisplay();
    startGame.display();
    options.display();
    
    if (startGame.pressed()) gameState = 1;
    if (options.pressed()) gameState = 2;
    
    stars.draw();

}
