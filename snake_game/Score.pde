class Score {
  
  // variables
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
  
  // methods
  void frame() {
    textSize(17);
    textAlign(CENTER);
    text("Score:" + scoreValue + "     " + "Highscore:" + highscoreValue, width/2, 35);
  }
}
