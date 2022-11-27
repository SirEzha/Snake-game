class Score {
  
  // variables
  int scoreValue = 0;
  int highscoreValue = 0;
  
  void frame() {
    textSize(17);
    textAlign(CENTER);
    text("Current score: " + scoreValue + "         " + "Highscore: " + highscoreValue, width/2, 30);
  }
}
