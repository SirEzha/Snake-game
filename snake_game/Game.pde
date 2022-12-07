class Game {
  
  // class instances
  Snake snake;
  Food food;
  Score score;
  
  // variables
  boolean isRunning = true;
  boolean isPressEligible = true;
  
  // constants
  final int SIZE = 30;
  
  Game() {
    snake = new Snake();  
    food = new Food();
    score = new Score();
    snake.SIZE = SIZE;
    food.SIZE = SIZE;
  }
  
  void frame() {
    background(0);
    snake.frame();
    drawScoreBackground();
    food.frame();
    score.frame();
    if (isSnakeOnFood() == true) {
      snake.eat();
      food.reappear(snake.getSnakeArray());
      score.scoreValue++;
    }
    if (snake.isSelfCollided()) {
      loseGame();
    }
    if (snake.isWallCollided()) {
      loseGame();
    }
  }
  
  boolean isSnakeOnFood() {
    boolean returnValue = false;
    
    if (snake.getSnakeArray().get(0)[0] == food.xPos && snake.getSnakeArray().get(0)[1] == food.yPos) {
      returnValue = true;
    }
    return returnValue;
  }
  
  void drawScoreBackground() {
    fill(#959595);
    rect(0, 0, width, 60);
  }
  
  void loseGame() {
    isRunning = false;
  }
}
