/* 
TODO list:

1!. add a queue of command. RN the problem is that if two buttons are pressed in the same frame, only one will be executed.
An idea to do that is to actually increase the FPS to 60, but leave the snake FPS on 8.
.. the work on functional part is over, now to code style and optimisation
2. extend the game window to allow for score and highscore place on top of the window
4. Move the gameover code chunk in main to a separate function

Snake game. Should I say more?
*/
Game game;
GameoverScreen gameover;


void setup() {
  size(480, 480);
  game = new Game();
  gameover = new GameoverScreen();
  frameRate(8);
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
