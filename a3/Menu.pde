// Purpose: Creates and manages menus
class Menu {

    StarField stars;

    MenuButton
        startGame,
        options,
        heading,
        volumeHeading,
        backButton,
        returnToGame,
        backToMain,
        nextLevel;

    HScrollbar volumeBarMusic;

    /**
     * Purpose:  Contructor for Menu.
     * Args:  Null
     * Return:  Null
     */
    Menu() {

        stars = new StarField();
        createButtons();
        volumeBarMusic = new HScrollbar();

    }


    /**
     * Purpose:  Create buttons.
     * Args:  Null
     * Return:  Null
     */
    void createButtons() {

        // Main Menu Buttons
        startGame = new MenuButton("start game", width/2, height/2);
        options = new MenuButton("options", width/2, height * 3.5/5);
        heading = new MenuButton("Missile Command", width/2, height/4);

        // Options Menu Buttons
        volumeHeading = new MenuButton(
            "Music Volume", width/2, height * 2/5);
        backButton = new MenuButton(
            "Back to main", width/2, height * 4.5/5);

        // Pause Menu Buttons
        returnToGame = new MenuButton("Return To Game", width/2, height/3);
        backToMain = new MenuButton("Back to main", width/2, height * 4.5/5);

        // Level Menu Button
        nextLevel = new MenuButton(
            "next level", width/2, height/3);

    }

    /**
     * Purpose: Display the main menu.
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
     * Purpose:  Dispay Options Menu.
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
        volumeBarMusic.changeVolume();
        heading.headingDisplay();
        stars.draw();
    }


    /**
     * Purpose: Display the Pause Menu.
     * Args: Null
     * Returns: Null
     */
    void displayPauseMenu() {
        drawMenuBackground();
        backToMain.thirdDisplay();
        returnToGame.thirdDisplay();
        if (returnToGame.pressed()) {
            gameState = 1;
        }
       // If click on back to main, go back to main
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
        text("Level " + level + "\nScore: " + score, width/2, height/2);
    }

    /**
     * Purpose: Display level transition menu.
     * Args: Null
     * Returns: Null
     */
    void displayLevelMenu() {
        drawMenuBackground();
        nextLevel.thirdDisplay();
        backToMain.thirdDisplay();

        // If click on next level button, set next level and start game.
        if (nextLevel.pressed()) {
            level ++;
            setLevel();
            gameState = 1;
        }
        
          if (backToMain.pressed()) {
            sound.music = sound.currentlyPlaying();
            sound.music.stop();
            setup();
            level = 0;
            gameState = 0;
        }

        // Display score.
        textFont(image.zigBlack);
        textSize(100);
        textAlign(CENTER);
        fill(120, 180, 60);
        text("Level " + level + "\nScore: " + score, width/2, height/2);
    }
}

    /**
     * Purpose: Draw background rectangle for game over
     * Args: Null
     * Returns: Null
     */
      void drawMenuBackground(){
      fill(#0A0A0A, 3);
      noStroke();
      rect(width/4, height/5, width *1/2, height *7/9);
      }
      
     /**
     * Purpose: Draw background rectangle for menu
     * Args: Null
     * Returns: Null
     */
      void drawGameOverBackground(){
      fill(#0A0A0A, 3);
      noStroke();
      rect(width/4, height/9, width *1/2, height * 11/12);
      }
