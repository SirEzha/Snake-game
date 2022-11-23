/* 
TODO list:
2. Stop food from spawning inside of a snake
3. Introduce game speed up via increasing the framerate
4. govnokod fix

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

void draw(){
  if (game.gameRunning || gameover.checker){
    game.frame();
  }
  // polnaya poebota a ne kod, nado fixit'
  // navaleno govna
  else {
    gameover.highscore = game.finalScore;
    gameover.frame();
    if (gameover.checker) {
      game = new Game();
      game.score.highscore = gameover.highscore;
      gameover = new GameoverScreen();
    }
  }
}
