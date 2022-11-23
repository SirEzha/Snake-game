class Game {
  
  Snakes snake;
  Food food;
  Score score;
  
  boolean gameRunning = true;
  final int SIZE = 30;
  int finalScore;
  
  Game() {
    snake = new Snakes();  
    food = new Food();
    score = new Score();
    snake.size = SIZE;
    food.size = SIZE;
  }
  
  void frame() {
    bgDraw();
    snake.frame();
    food.exist();
    score.show();
    if (isSnakeOnFood() == true) {
      snake.eat();
      food.reappear(snake.snakeArray);
      score.increase();
    }
    if (snake.isSelfCollided()) {
      gameOver();
    }
    if (snake.isWallCollided()) {
      gameOver();
    }
  }
  
  void bgDraw() {
    background(0);
  }
  
  boolean isSnakeOnFood() {
    if (snake.snakeArray.get(0)[0] == food.xPos && snake.snakeArray.get(0)[1] == food.yPos) {
      return true;
    }
    return false;
  }
  
  void gameOver() {
    gameRunning = false;
    finalScore = score.score;
  }
}
