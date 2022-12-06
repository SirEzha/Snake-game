/* 
TODO list:

1. change the queue array to linked list in snake class
2. move the keyPressed methods to the main class from other classes
.. the work on functional part is over, now to code style and optimisation
2. extend the game window to allow for score and highscore place on top of the window
4. Move the gameover code chunk in main to a separate function

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
    if ((key == 'w') && game.currentKey != 'w') {
      game.snake.keyStorage[game.snake.keyCount] = 'w';
      game.snake.keyCount++;
      game.currentKey = 'w';
      print('w');
    }
    if ((key == 's') && game.currentKey != 's') {
      game.snake.keyStorage[game.snake.keyCount] = 's';
      game.snake.keyCount++;
      game.currentKey = 's';
      print('s');
    }
    if ((key == 'a') && game.currentKey != 'a') {
      game.snake.keyStorage[game.snake.keyCount] = 'a';
      game.snake.keyCount++;
      game.currentKey = 'a';
      print('a');
    }
    if ((key == 'd') && game.currentKey != 'd') {
      game.snake.keyStorage[game.snake.keyCount] = 'd';
      game.snake.keyCount++;
      game.currentKey = 'd';
      print('d');
    }
  }
