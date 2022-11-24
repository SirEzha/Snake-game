import java.util.ArrayList;

class Snake {
  
  int xSpeed = 30;
  int ySpeed = 0;
  int SIZE;
  
  ArrayList<int[]> snakeArray = new ArrayList<int[]>();
  
  Snake() {
    // initial snake
    int[] pos1 = {30, 30};
    int[] pos2 = {60, 30};
    int[] pos3 = {90, 30};
    snakeArray.add(pos1);
    snakeArray.add(pos2);
    snakeArray.add(pos3);
  }
  
  void frame() {
    keyPressed();
    moveSnake();
    for (int i = 0; i < snakeArray.size(); ++i) {
      square(snakeArray.get(i)[0], snakeArray.get(i)[1], SIZE);
    }
  }
   //<>//
  void keyPressed() {
    if (keyCode == UP && ySpeed != SIZE) {
      xSpeed = 0;
      ySpeed = -SIZE;
    }
    if (keyCode == DOWN && ySpeed != -SIZE) {
      xSpeed = 0;
      ySpeed = SIZE;
    }
    if (keyCode == LEFT && xSpeed != SIZE) {
      xSpeed = -SIZE;
      ySpeed = 0;
    }
    if (keyCode == RIGHT && xSpeed != -SIZE) {
      xSpeed = SIZE;
      ySpeed = 0;
    }
  }
  
  void moveSnake() {
    // move the tail
    for (int i = snakeArray.size() - 1; i > 0; --i) {
      snakeArray.set(i, snakeArray.get(i-1));
    }
    // move the head
    int[] updatedPos = {snakeArray.get(0)[0] + xSpeed, snakeArray.get(0)[1] + ySpeed};
    snakeArray.set(0, updatedPos);
  }
  
  void eat() {
    int[] newPart = {snakeArray.get(0)[0] + xSpeed, snakeArray.get(0)[1] + ySpeed};
    snakeArray.add(newPart);
  }
  
  boolean isSelfCollided() {
    for (int i = 1; i < snakeArray.size() - 1; ++i) {
      if (snakeArray.get(0)[0] == snakeArray.get(i)[0] && snakeArray.get(0)[1] == snakeArray.get(i)[1]) {
        return true;
      }
    }
    return false;
  }
  
  boolean isWallCollided() {
    if (snakeArray.get(0)[0] < 0 || snakeArray.get(0)[0] > 479 || snakeArray.get(0)[1] < 0 || snakeArray.get(0)[1] > 479) {
      return true; 
    }
    return false;
  }
}
