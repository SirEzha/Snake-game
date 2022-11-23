class GameoverScreen {
  boolean checker = false;
  int highscore;
  
  void frame() {
    keyPressed();
    background(150);
    //textSize(60);
    text("You have scored: " + highscore, height/2, width/2);
  }
  
  void keyPressed() {
    if (key == 'r' || key == 'R') {
      checker = true;
      key = 'a';
    }
  }
}
