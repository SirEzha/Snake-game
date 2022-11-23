class Score {
  
  int score = 0;
  int highscore = 0;
  
  void increase() {
    ++score;
  }
  
  void show() {
    textSize(20);
    text("Score: " + score + "\n" + "Highscore is: " + highscore, 250, 30);
  }
}
