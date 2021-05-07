HScrollbar hs1;


void displayOptionsMenu() {
    background(0, 0, 16);
    MenuButton volumeHeading = new MenuButton("Music Volume", width * 2.8/12, height * 2/5);
    MenuButton backButton = new MenuButton("Back to main", width * 3/12, height * 4.5/5);
    backButton.display();
    volumeHeading.display();
    if (backButton.pressed()) {
        if (gameState == 2) {
            gameState = 0;
        }
    } 
    displayScrollBar();
    volumeControl();
    displayHeading();
    drawStars();
}

void displayScrollBar() {
    hs1.update();
    hs1.display();
}


void volumeControl() {
    float scrollBarPosition = hs1.getPos();
    float volume = 1.0;
    volume = map(scrollBarPosition, 0, width, 0.0, 1.0);
    sound.music.amp(volume);
}
