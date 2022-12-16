class GameoverScreen {
  
  // variables
  boolean isGameover = true;
  int scoreValue = 0;
  int highscoreValue = 0;
  
  // getters and setters
  void setScore(int currentValue) {
    scoreValue = currentValue;
  }
  
  int getScore() {
    return scoreValue; 
  }
  
  void setHighscore(int currentValue) {
    highscoreValue = currentValue;
  }
  
  int getHighscore() {
    return highscoreValue; 
  }
  
  boolean getGameoverState() {
    return isGameover;
  }
  
  void setGameoverState(boolean currentValue) {
    isGameover = currentValue;
  }
  
  // methods
  void frame() {
    background(150);
    titleDraw();
    fill(255);
    textAlign(CENTER);
    textSize(22);
    text("You have scored: " + scoreValue + "\n\n" + "Highscore is: " + highscoreValue, width/2, height/2);
    textSize(10);
    text("Press 'r' to restart", width/2, 12*height/13);
  }
  
  // this method is it hands-draws the pixels for the game title
  void titleDraw() {
    int particleSize = 14;
    int offsetX = 58;
    int offsetY = 100;
    
    // letter S
    fill(#FF0000);
    square(offsetX, offsetY, particleSize);
    square(offsetX+particleSize, offsetY, particleSize);
    square(offsetX+2*particleSize, offsetY, particleSize);
    square(offsetX+3*particleSize, offsetY, particleSize);
    square(offsetX, offsetY+particleSize, particleSize);
    square(offsetX, offsetY+2*particleSize, particleSize);
    square(offsetX+particleSize, offsetY+2*particleSize, particleSize);
    square(offsetX+2*particleSize, offsetY+2*particleSize, particleSize);
    square(offsetX+3*particleSize, offsetY+2*particleSize, particleSize);
    square(offsetX+3*particleSize, offsetY+3*particleSize, particleSize);
    square(offsetX+3*particleSize, offsetY+4*particleSize, particleSize);
    square(offsetX+2*particleSize, offsetY+4*particleSize, particleSize);
    square(offsetX+particleSize, offsetY+4*particleSize, particleSize);
    square(offsetX, offsetY+4*particleSize, particleSize);
    
    // letter N
    fill(#0006FF);
    square(offsetX+5*particleSize, offsetY, particleSize);
    square(offsetX+9*particleSize, offsetY, particleSize);
    square(offsetX+5*particleSize, offsetY+particleSize, particleSize);
    square(offsetX+6*particleSize, offsetY+particleSize, particleSize);
    square(offsetX+9*particleSize, offsetY+particleSize, particleSize);
    square(offsetX+5*particleSize, offsetY+2*particleSize, particleSize);
    square(offsetX+7*particleSize, offsetY+2*particleSize, particleSize);
    square(offsetX+9*particleSize, offsetY+2*particleSize, particleSize);
    square(offsetX+5*particleSize, offsetY+3*particleSize, particleSize);
    square(offsetX+8*particleSize, offsetY+3*particleSize, particleSize);
    square(offsetX+9*particleSize, offsetY+3*particleSize, particleSize);
    square(offsetX+5*particleSize, offsetY+4*particleSize, particleSize);
    square(offsetX+9*particleSize, offsetY+4*particleSize, particleSize);
    
    // letter A
    fill(#00FF12);
    square(offsetX+13*particleSize, offsetY, particleSize);
    square(offsetX+12*particleSize, offsetY+particleSize, particleSize);
    square(offsetX+13*particleSize, offsetY+particleSize, particleSize);
    square(offsetX+14*particleSize, offsetY+particleSize, particleSize);
    square(offsetX+12*particleSize, offsetY+2*particleSize, particleSize);
    square(offsetX+14*particleSize, offsetY+2*particleSize, particleSize);
    square(offsetX+11*particleSize, offsetY+3*particleSize, particleSize);
    square(offsetX+12*particleSize, offsetY+3*particleSize, particleSize);
    square(offsetX+14*particleSize, offsetY+3*particleSize, particleSize);
    square(offsetX+15*particleSize, offsetY+3*particleSize, particleSize);
    square(offsetX+11*particleSize, offsetY+4*particleSize, particleSize);
    square(offsetX+15*particleSize, offsetY+4*particleSize, particleSize);
    
    // letter K
    fill(#FFF700);
    square(offsetX+17*particleSize, offsetY, particleSize);
    square(offsetX+20*particleSize, offsetY, particleSize);
    square(offsetX+17*particleSize, offsetY+particleSize, particleSize);
    square(offsetX+19*particleSize, offsetY+particleSize, particleSize);
    square(offsetX+17*particleSize, offsetY+2*particleSize, particleSize);
    square(offsetX+18*particleSize, offsetY+2*particleSize, particleSize);
    square(offsetX+17*particleSize, offsetY+3*particleSize, particleSize);
    square(offsetX+19*particleSize, offsetY+3*particleSize, particleSize);
    square(offsetX+17*particleSize, offsetY+4*particleSize, particleSize);
    square(offsetX+20*particleSize, offsetY+4*particleSize, particleSize);
    
    // letter E
    fill(#FF00E2);
    square(offsetX+22*particleSize, offsetY, particleSize);
    square(offsetX+23*particleSize, offsetY, particleSize);
    square(offsetX+24*particleSize, offsetY, particleSize);
    square(offsetX+25*particleSize, offsetY, particleSize);
    square(offsetX+22*particleSize, offsetY+particleSize, particleSize);
    square(offsetX+22*particleSize, offsetY+2*particleSize, particleSize);
    square(offsetX+23*particleSize, offsetY+2*particleSize, particleSize);
    square(offsetX+24*particleSize, offsetY+2*particleSize, particleSize);
    square(offsetX+22*particleSize, offsetY+3*particleSize, particleSize);
    square(offsetX+22*particleSize, offsetY+4*particleSize, particleSize);
    square(offsetX+23*particleSize, offsetY+4*particleSize, particleSize);
    square(offsetX+24*particleSize, offsetY+4*particleSize, particleSize);
    square(offsetX+25*particleSize, offsetY+4*particleSize, particleSize);
  }
}
