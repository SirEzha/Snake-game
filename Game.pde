class Game {
  
  Snake snake;
  Food food;
  Score score;
  
  final int SIZE = 30;
  
  Game() {
    //food = new Food();
    snake = new Snake();
    food = new Food();
    score = new Score();
    snake.size = SIZE;
    food.size = SIZE;
  }
  
  void frame() {
    bgDraw();
    snake.move();
    food.exist();
    score.show();
    if (snakeOnFood() == true) {
      snake.eat();
      food.reappear();
      score.increase();
    }
  }
  
  void bgDraw() {
    background(0);
  }
  
  boolean snakeOnFood() {
    if (snake.posArray.get(0)[0] == food.xPos && snake.posArray.get(0)[1] == food.yPos) {
      return true;
    }
    return false;
  }
}
