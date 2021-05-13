// Purpose: Creates and manages menus
class Menu {
    
    MenuButton
        startGame,
        options,
        heading,
        volumeHeading,
        backButton,
        returnToGame,
        backToMain,
        nextLevel;

    Menu() {
        createButtons();

    }
    
    /**
    * Purpose:  Create buttons.
    * Args:  Null
    * Return:  Null
    */
    void createButtons() {

        // Main Menu Buttons
        startGame = new MenuButton("start game", width * 3 / 12, height / 2);
        options = new MenuButton("options", width * 4 / 12, height * 3.5 / 5);
        heading = new MenuButton("Missile Command", width / 2, height / 4);

        //  Options Menu Buttons
        volumeHeading = new MenuButton("Music Volume", width * 2.8 / 12, height * 2 / 5);
        backButton = new MenuButton("Back to main", width * 3 / 12, height * 4.5 / 5);

        // Pause Menu Buttons
        returnToGame = new MenuButton("Return To Game", width / 2, height / 3);      //same question third time, should buttons be set up from setup()/createButtons() etc?
        backToMain = new MenuButton("Back to main", width / 2, height * 4.5 / 5);    //otherwise, good code :)

        // Level Menu Button
        nextLevel = new MenuButton("click to start next level", width / 2, height / 3);

    }

    /**
    * Purpose:  To keep all the logic for displaying the main menu in the one area
    * Args:  Null
    * Return:  Null
    */
    void displayMainMenu() {

        background(0, 0, 16);

        heading.headingDisplay();
        startGame.display();
        options.display();

        if (startGame.pressed()) gameState = 1;
        if (options.pressed()) gameState = 2;

        stars.draw();
    }

    /**
    * Purpose:  To keep all the logic for the options menu in the one area
    * Args: Null
    * Return: Null
    */
    void displayOptionsMenu() {

        background(0, 0, 16);

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
        stars.draw();
    }


    /**
    * Purpose:  To map the position the amplitude of the background music with * the scroll bar
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

    /**
    * Purpose:Keeps the logic of the pause menu logic together
    * Args: Null
    * Returns: Null
    */
    void displayPauseMenu() {

        backToMain.thirdDisplay();
        returnToGame.thirdDisplay();

        if (returnToGame.pressed()) {
            gameState = 1;
        }

        if (backToMain.pressed()) {
            sound.music = sound.currentlyPlaying();
            sound.music.stop();
            setup();
            level = 0;
            gameState = 0;
        }

        textSize(100);
        textAlign(CENTER);
        fill(120, 180, 60);
        text("Level " + level + "\nScore: " + score, width / 2, height / 2);
    }

    /**
    * Purpose: All the logic for the inbetween level menu display in the one area
    * Args: Null
    * Returns: Null
    */
    void displayLevelMenu() {

        nextLevel.thirdDisplay();

        //ifclick on next level button, set next level and start game
        if (nextLevel.pressed()) {
            level ++;
            setLevel();
            gameState = 1;
        }

        //display score
        textFont(image.zigBlack);
        textSize(100);
        textAlign(CENTER);
        fill(120, 180, 60);
        text("Level " + level + "\nScore: " + score, width / 2, height / 2);
    }
}
