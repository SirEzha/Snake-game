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
  
  // methods
  void frame() {
    keyPressed();
    background(150);
    textSize(25);
    text("You have scored: " + scoreValue + "\n" + "Current highscore is: " + highscoreValue, height/2, width/2);
  }
  
  void keyPressed() {
    if (key == 'r' || key == 'R') {
      isGameover = false;
      // overwrite the variable because it does not automatically reset
      key = 'p';
    }
  }
}
