/* 
TODO list:

1. change the queue array to linked list in snake class
.. the work on functional part is over, now to code style and optimisation

Snake game. Should I say more?
*/

// class instances
Game game;
GameoverScreen gameover;

void setup() {
  size(480, 480);
  game = new Game();
  gameover = new GameoverScreen();
  frameRate(60);
}

void draw() {
  if (game.isRunning){
    game.frame();
  } else {
    gameoverFrame();
  }
}

void gameoverFrame() {
  if (game.score.scoreValue > game.score.highscoreValue) {
    game.score.highscoreValue = game.score.scoreValue;
  }
  gameover.scoreValue = game.score.scoreValue;
  gameover.highscoreValue = game.score.highscoreValue;
  gameover.frame();
  if (!gameover.isGameover) {
    game = new Game();
    game.score.highscoreValue = gameover.highscoreValue;
    gameover = new GameoverScreen();
  }
}

void keyPressed() {
    if ((key == 'w')) {
      game.snake.keyStorage[game.snake.keyCount] = 'w';
      game.snake.keyCount++;
    }
    if ((key == 's')) {
      game.snake.keyStorage[game.snake.keyCount] = 's';
      game.snake.keyCount++;
    }
    if ((key == 'a')) {
      game.snake.keyStorage[game.snake.keyCount] = 'a';
      game.snake.keyCount++;
    }
    if (key == 'd') {
      game.snake.keyStorage[game.snake.keyCount] = 'd';
      game.snake.keyCount++;
    }
  }
