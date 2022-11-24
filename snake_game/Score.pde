class Score {
  
  int scoreValue = 0;
  int highscoreValue = 0;
  
  void frame() {
    textSize(17);
    text("Score: " + scoreValue + "\n" + "Highscore is: " + highscoreValue, 250, 30);
  }
}
