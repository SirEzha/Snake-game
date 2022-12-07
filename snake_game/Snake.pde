import java.util.*;
import java.lang.Character;

class Snake {
  
  // variables
  int xSpeed = 30;
  int ySpeed = 0;
  ArrayList<int[]> snakeArray = new ArrayList<int[]>();
  LinkedList<Character> keyStorage = new LinkedList<Character>();
  char currentKey; // the movement key that will be executed this frame
  int keyCount = 0; // amount of keys queued
  
  // quasiconstants
  int SIZE;
  
  Snake() {
    // initial snake coordinates
    int[] pos1 = {30, 60};
    int[] pos2 = {60, 60};
    int[] pos3 = {90, 60};
    snakeArray.add(pos1);
    snakeArray.add(pos2);
    snakeArray.add(pos3);
  }
  
  // getters and setters
  ArrayList<int[]> getSnakeArray() { //<>//
    return snakeArray;
  }
  
  void addKeyToStorage(char keyToAdd) {
    keyStorage.addLast(keyToAdd); 
  }
  
  char getKeyFromStorage() {
    char firstElement = 'o';
    if (keyStorage.peekFirst() != null) {
      firstElement = keyStorage.removeFirst(); // not only gets the movement button but also removes it afterwards
    }
    return firstElement;
  }
  
  // methods
  void frame() {
    // limiting the effective snake framerate to 60/7 ~ 9fps
    if (frameCount % 7 == 0) {
      turnSnake();
      moveSnake();
    }
    
    for (int i = 0; i < snakeArray.size(); ++i) {
      square(snakeArray.get(i)[0], snakeArray.get(i)[1], SIZE);
    }
  }
  
  void turnSnake() {
    // getting the current 'move' value
    currentKey = getKeyFromStorage();
    
    // turning the snake
    if (currentKey == 'w') {
      if (ySpeed != SIZE) {
        xSpeed = 0;
        ySpeed = -SIZE;
      }
    }
    if (currentKey == 's') {
      if (ySpeed != -SIZE) {
        xSpeed = 0;
        ySpeed = SIZE;
      }
    }
    if (currentKey == 'a') {
      if (xSpeed != SIZE) {
        xSpeed = -SIZE;
        ySpeed = 0;
      }
    }
    if (currentKey == 'd') {
      if (xSpeed != -SIZE) {
        xSpeed = SIZE;
        ySpeed = 0;
      }
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
    boolean returnValue = false;    
    for (int i = 1; i < snakeArray.size() - 1; ++i) {
      if (snakeArray.get(0)[0] == snakeArray.get(i)[0] && snakeArray.get(0)[1] == snakeArray.get(i)[1]) {
        returnValue = true;
      }
    }
    return returnValue;
  }
  
  boolean isWallCollided() {
    boolean returnValue = false;    
    if (snakeArray.get(0)[0] < 0 || snakeArray.get(0)[0] > 479 || snakeArray.get(0)[1] < 60 || snakeArray.get(0)[1] > 479) {
      returnValue = true; 
    }
    return returnValue;
  }
}
