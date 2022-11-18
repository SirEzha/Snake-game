class Game {
  
  Snakes snake;
  Food food;
  Score score;
  
  final int SIZE = 30;
  
  Game() {
    //food = new Food();
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
    if (snakeOnFood() == true) {
      snake.eat();
      food.reappear();
      score.increase();
    }
    if (snake.selfCollision()) {
      gameOver();
    }
  }
  
  void bgDraw() {
    background(0);
  }
  
  boolean snakeOnFood() {
    if (snake.snakeArray.get(0)[0] == food.xPos && snake.snakeArray.get(0)[1] == food.yPos) {
      return true;
    }
    return false;
  }
  
  void gameOver() {
    print("sos");
  }
}
