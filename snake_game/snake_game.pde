/* 
TODO list:
1. Add collisions with walls and other snake parts
2. Stop food from spawning inside of a snake
3. Introduce game speed up via increasing the framerate
4. Add proper gameover

Snake game.
*/
Game game;
//Snake snake;

void setup() {
  size(480, 480);
  game = new Game();
  //snake = new Snake();
  frameRate(8);
}

void draw(){
  game.frame();
  //noLoop();
}
