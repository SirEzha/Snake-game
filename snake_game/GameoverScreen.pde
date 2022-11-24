class GameoverScreen {
  
  boolean isGameover = true;
  int scoreValue = 0;
  int highscoreValue = 0;
  
  void frame() {
    keyPressed();
    background(150);
    textSize(25);
    text("You have scored: " + scoreValue + "\n" + "Current highscore is: " + highscoreValue, height/2, width/2);
  }
  
  void keyPressed() {
    if (key == 'r' || key == 'R') {
      isGameover = false;
      key = 'p';
    }
  }
}
