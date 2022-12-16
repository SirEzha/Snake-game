/*
Classic version of Snake game.

Controls:
* wasd - to control the snake
* r - to restart the game during gameover


Author: Sergei Baginskii
*/

// class instances
Game game;
GameoverScreen gameover;

// font variable
PFont mono;

void setup() {
  size(480, 480);
  game = new Game();
  gameover = new GameoverScreen();
  game.newFoodSetup(); // first food spawn
  frameRate(60);
  
  // setting up the font
  mono = createFont("font_joystix.ttf", 128);
  textFont(mono);
}

void draw() {
  if (game.isRunning){
    game.frame();
  } else {
    gameoverFrame();
  }
}

void gameoverFrame() {
  if (game.score.getScore() > game.score.getHighscore()) {
    game.score.setHighscore(game.score.getScore());
  }
  gameover.setScore(game.score.scoreValue);
  gameover.setHighscore(game.score.highscoreValue);
  gameover.frame();
  if (!gameover.getGameoverState()) {
    game = new Game();
    game.newFoodSetup();
    game.score.setHighscore(gameover.getHighscore());
    gameover = new GameoverScreen();
  }
}

void keyPressed() {
    if (key == 'w') {
      game.snake.addKeyToStorage('w');
    }
    if (key == 's') {
      game.snake.addKeyToStorage('s');
    }
    if (key == 'a') {
      game.snake.addKeyToStorage('a');
    }
    if (key == 'd') {
      game.snake.addKeyToStorage('d');
    }
    if (!game.isRunning && key == 'r') {
      gameover.setGameoverState(false);
      key = 'o';
    }
  }
