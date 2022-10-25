class Score {
  
  int score = 0;
  
  void increase() {
    ++score;
  }
  
  void show() {
    textSize(20);
    text("Score: " + score, 250, 30);
  }
}
