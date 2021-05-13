/**
 * Purpose:  To keep all the logic for the options menu in the one area
 * Args: Null
 * Return: Null
 */
void displayOptionsMenu() {

  
    background(0, 0, 16);
    MenuButton volumeHeading = new MenuButton("Music Volume", width * 2.8/12, height * 2/5);
    MenuButton backButton = new MenuButton("Back to main", width * 3/12, height * 4.5/5);
    MenuButton heading = new MenuButton("Missile Command", width/2, height/4);    
    
    backButton.display();
    volumeHeading.display();
    
    if (backButton.pressed()) {
        if (gameState == 2) {
            gameState = 0;
        }
    }

    volumeBarMusic.draw();
    volumeControl();
    heading.headingDisplay();
    //displayHeading();
    stars.draw();
}


/**
 * Purpose:  To map the position the amplitude of the background music with the scroll bar
 * Args: none
 * Return: none
 */
void volumeControl() {
    float scrollBarPosition = volumeBarMusic.getPos();
    float volume = 1.0;
    
    volume = map(scrollBarPosition, 0, width, 0.0, 1.0);
    
    sound.music = sound.currentlyPlaying();
    sound.music.amp(volume);
    sound.theme.amp(volume);
}
