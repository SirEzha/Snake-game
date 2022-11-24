class Game {
  
  Snake snake;
  Food food;
  Score score;
  
  boolean isRunning = true;
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
    food.frame();
    score.frame();
    if (isSnakeOnFood() == true) {
      snake.eat();
      food.reappear(snake.snakeArray);
      score.scoreValue++;
    }
    if (snake.isSelfCollided()) {
      lose();
    }
    if (snake.isWallCollided()) {
      lose();
    }
  }
  
  boolean isSnakeOnFood() {
    if (snake.snakeArray.get(0)[0] == food.xPos && snake.snakeArray.get(0)[1] == food.yPos) {
      return true;
    }
    return false;
  }
  
  void lose() {
    isRunning = false;
  }
}
