/* 
TODO list:
2. extend the game window to allow for score and highscore place on top of the window
3. Introduce game speed up via increasing the framerate
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
  if (game.gameRunning){
    game.frame();
  } else {
      if (game.score.score > game.score.highscore) {
        game.score.highscore = game.score.score;
      }
      gameover.score = game.score.score;
      gameover.highscore = game.score.highscore;
      gameover.frame();
      if (!gameover.isGameover) {
        game = new Game();
        game.score.highscore = gameover.highscore;
        gameover = new GameoverScreen();
      }
  }
}
