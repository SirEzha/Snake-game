import java.util.ArrayList;
//import java.lang.System.arraycopy;

class Snake {
  
  // variables
  int xSpeed = 30;
  int ySpeed = 0;
  ArrayList<int[]> snakeArray = new ArrayList<int[]>();
  char[] keyStorage = new char[5];
  char currentKey; // the movement key that will be executed this frame
  int keyCount = 0; // amount of keys queued
  
  // quasiconstants
  int SIZE;
  
  Snake() {
    // initial snake
    int[] pos1 = {30, 60};
    int[] pos2 = {60, 60};
    int[] pos3 = {90, 60};
    snakeArray.add(pos1);
    snakeArray.add(pos2);
    snakeArray.add(pos3);
  }
  
  void frame() {
    // limiting the effective snake framerate to 60/7 ~ 9fps //<>//
    if (frameCount % 7 == 0) {
      //println(keyStorage);
      turnSnake();
      moveSnake();
    }
    
    for (int i = 0; i < snakeArray.size(); ++i) {
      square(snakeArray.get(i)[0], snakeArray.get(i)[1], SIZE);
    }
  }
  
  void turnSnake() {
    // working with array
    currentKey = keyStorage[0];
    arrayCopy(keyStorage, 1, keyStorage, 0, keyStorage.length-1);
    
    // turning the snake
    if (currentKey == 'w' && ySpeed != SIZE) {
      xSpeed = 0;
      ySpeed = -SIZE;
      keyCount--;
    }
    if (currentKey == 's' && ySpeed != -SIZE) {
      xSpeed = 0;
      ySpeed = SIZE;
      keyCount--;
    }
    if (currentKey == 'a' && xSpeed != SIZE) {
      xSpeed = -SIZE;
      ySpeed = 0;
      keyCount--;
    }
    if (currentKey == 'd' && xSpeed != -SIZE) {
      xSpeed = SIZE;
      ySpeed = 0;
      keyCount--;
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
    if (snakeArray.get(0)[0] < 0 || snakeArray.get(0)[0] > 479 || snakeArray.get(0)[1] < 60 || snakeArray.get(0)[1] > 479) {
      return true; 
    }
    return false;
  }
}
