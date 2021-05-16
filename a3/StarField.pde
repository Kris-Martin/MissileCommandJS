//Purpose: Creates starfield display.
class StarField {
  Star[] stars = new Star[400];
  /**
   * Purpose:  Starfield constructor function initiates the stars array.
   * Args: Null
   * Return: Null
   */
  StarField() {
    for (int i = 0; i < stars.length; i++)
      stars[i] = new Star();
  }



  /**
   * Purpose: Draws and updates the star field.
   * Args: Null
   * Returns: Null
   */
  void draw() {
    translate(0.5*width, 0.5*height);
    // Update and draw all stars.
    for (int i=0; i<stars.length; i++) {
      stars[i].update();
      stars[i].show();
    }
  }
}
