class Game {
  
  // class instances
  Snake snake;
  Food food;
  Score score;
  
  // variables
  boolean isRunning = true;
  boolean isPressEligible = true;
  char currentKey;
  
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
    keyPressed();
    snake.frame();
    drawScoreBackground();
    food.frame();
    score.frame();
    if (isSnakeOnFood() == true) {
      snake.eat();
      food.reappear(snake.snakeArray);
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
    if (snake.snakeArray.get(0)[0] == food.xPos && snake.snakeArray.get(0)[1] == food.yPos) {
      return true;
    }
    return false;
  }
  
  void drawScoreBackground() {
    fill(#959595);
    rect(0, 0, width, 60);
  }
  
  void loseGame() {
    isRunning = false;
  }
  
  void keyPressed() {
    if ((key == 'w') && currentKey != 'w') {
      snake.keyStorage[snake.keyCount] = 'w';
      snake.keyCount++;
      currentKey = 'w';
      print('w');
    }
    if ((key == 's') && currentKey != 's') {
      snake.keyStorage[snake.keyCount] = 's';
      snake.keyCount++;
      currentKey = 's';
      print('s');
    }
    if ((key == 'a') && currentKey != 'a') {
      snake.keyStorage[snake.keyCount] = 'a';
      snake.keyCount++;
      currentKey = 'a';
      print('a');
    }
    if ((key == 'd') && currentKey != 'd') {
      snake.keyStorage[snake.keyCount] = 'd';
      snake.keyCount++;
      currentKey = 'd';
      print('d');
    }
  }
}
