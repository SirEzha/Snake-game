/* Snake game.
*/
Game game;

void setup() {
  size(500, 500);
  game = new Game();
  frameRate(8);
}

void draw(){
  background(0);
  game.frame();
}
