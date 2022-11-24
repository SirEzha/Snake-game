class GameoverScreen {
  boolean isGameover = true;
  int score = 0;
  int highscore = 0;
  
  void frame() {
    keyPressed();
    background(150);
    //textSize(60);
    text("You have scored: " + score + "\n" + "Current highscore is: " + highscore, height/2, width/2);
  }
  
  void keyPressed() {
    if (key == 'r' || key == 'R') {
      isGameover = false;
      key = 'a';
    }
  }
}
