import java.util.*;
import java.lang.Character;

class Snake {
  
  // variables
  int speedX = 0;
  int speedY = -30;
  ArrayList<int[]> snakeArray = new ArrayList<int[]>();
  LinkedList<Character> keyStorage = new LinkedList<Character>();
  char currentKey; // the movement key that will be executed this frame
  int keyCount = 0; // amount of keys queued
  char tailDirection;
  
  // quasiconstants
  int SIZE;
  
  Snake() {
    // initial snake coordinates
    int[] pos3 = {240, 330};
    int[] pos2 = {240, 300};
    int[] pos1 = {240, 270};
    snakeArray.add(pos1);
    snakeArray.add(pos2);
    snakeArray.add(pos3);
  }
  
  
  // getters and setters //<>//
  List<int[]> getSnakeArray() { //<>//
    return Collections.unmodifiableList(snakeArray); // readonly ArrayList in the format of List
  }
  
  char getKeyFromStorage() {
    char firstElement = 'o';
    if (keyStorage.peekFirst() != null) {
      firstElement = keyStorage.removeFirst(); // not only gets the movement button but also removes it afterwards
    }
    return firstElement;
  }
  
  void addKeyToStorage(char keyToAdd) {
    keyStorage.addLast(keyToAdd); 
  }
  
  // methods
  void frame() {
    // limiting the effective snake speed to 60/6 ~ 10 tiles/sec
    if (frameCount % 6 == 0) {
      turnSnake();
      moveSnake();
    }
    drawSnake();
    tailDirection = directionTailMovement();
  }
  
  void moveSnake() {
    // move the tail
    for (int i = snakeArray.size() - 1; i > 0; --i) {
      snakeArray.set(i, snakeArray.get(i-1));
    }
    // move the head
    int[] updatedPos = {snakeArray.get(0)[0] + speedX, snakeArray.get(0)[1] + speedY};
    snakeArray.set(0, updatedPos);
  }
  
  void turnSnake() {
    // getting the current 'move' value
    currentKey = getKeyFromStorage();
    
    // turning the snake
    if (currentKey == 'w') {
      if (speedY != SIZE) {
        speedX = 0;
        speedY = -SIZE;
      }
    }
    if (currentKey == 's') {
      if (speedY != -SIZE) {
        speedX = 0;
        speedY = SIZE;
      }
    }
    if (currentKey == 'a') {
      if (speedX != SIZE) {
        speedX = -SIZE;
        speedY = 0;
      }
    }
    if (currentKey == 'd') {
      if (speedX != -SIZE) {
        speedX = SIZE;
        speedY = 0;
      }
    }
  }
  
  void eat() {
    int tailSpeedX = 0;
    int tailSpeedY = 0;
    if (tailDirection == 'w') {
      tailSpeedY = -SIZE;
    }
    if (tailDirection == 's') {
      tailSpeedY = SIZE;
    }
    if (tailDirection == 'd') {
      tailSpeedX = SIZE;
    }
    if (tailDirection == 'a') {
      tailSpeedX = -SIZE;
    }
    int[] newPart = {snakeArray.get(snakeArray.size()-1)[0] - tailSpeedX, snakeArray.get(snakeArray.size()-1)[1] - tailSpeedY};
    snakeArray.add(snakeArray.size(), newPart);
  }
  
  
  // state getters
  char directionTailMovement() {
    char direction = 'i';
    if (snakeArray.get(snakeArray.size()-1)[1] - snakeArray.get(snakeArray.size()-2)[1] >= SIZE) {
      direction = 'w'; 
    } else {
      if (snakeArray.get(snakeArray.size()-1)[1] - snakeArray.get(snakeArray.size()-2)[1] <= -SIZE) {
        direction = 's'; 
      } else {
        if (snakeArray.get(snakeArray.size()-1)[0] - snakeArray.get(snakeArray.size()-2)[0] <= -SIZE) {
          direction = 'd';
        } else {
          if (snakeArray.get(snakeArray.size()-1)[0] - snakeArray.get(snakeArray.size()-2)[0] >= SIZE) {
            direction = 'a';
          }
        }
      }
    }
    return direction;
  }
  
  
  // collision checkers
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
    if (snakeArray.get(0)[0] < 0 || snakeArray.get(0)[0] > height-1 || snakeArray.get(0)[1] < 60 || snakeArray.get(0)[1] > height-1) {
      returnValue = true; 
    }
    return returnValue;
  }
  
  
  // draw functions
    void drawSnake() {
    for (int i = 0; i < snakeArray.size(); ++i) {
      if (i == 0) {
        square(snakeArray.get(i)[0], snakeArray.get(i)[1], SIZE);
        drawEyes();
      } else if (i != snakeArray.size()-1) {
          square(snakeArray.get(i)[0], snakeArray.get(i)[1], SIZE);
        } else {
          //square(snakeArray.get(i)[0], snakeArray.get(i)[1], SIZE);
          drawTail(snakeArray.size()-1);
        }
      }
      fill(255);
    }
  
  void drawEyes() {
    fill(0);
    if (speedX == 0 && speedY == -SIZE) {
      square(snakeArray.get(0)[0] + SIZE/6, snakeArray.get(0)[1] + SIZE/6, SIZE/6);
      square(snakeArray.get(0)[0] + 2*SIZE/3, snakeArray.get(0)[1] + SIZE/6, SIZE/6);
    } else if (speedX == 0 && speedY == SIZE) {
        square(snakeArray.get(0)[0] + SIZE/6, snakeArray.get(0)[1] + 2*SIZE/3, SIZE/6);
        square(snakeArray.get(0)[0] + 2*SIZE/3, snakeArray.get(0)[1] + 2*SIZE/3, SIZE/6);
      } else if (speedX == SIZE && speedY == 0) {
          square(snakeArray.get(0)[0] + 2*SIZE/3, snakeArray.get(0)[1] + SIZE/6, SIZE/6);
          square(snakeArray.get(0)[0] + 2*SIZE/3, snakeArray.get(0)[1] + 2*SIZE/3, SIZE/6);
        } else {
          square(snakeArray.get(0)[0] + SIZE/6, snakeArray.get(0)[1] + SIZE/6, SIZE/6);
          square(snakeArray.get(0)[0] + SIZE/6, snakeArray.get(0)[1] + 2*SIZE/3, SIZE/6);
        }
    fill(255);
  }
  
  void drawTail(int tailNumber) {
    if (tailDirection == 'w') {
      triangle(snakeArray.get(tailNumber)[0], snakeArray.get(tailNumber)[1], 
                snakeArray.get(tailNumber)[0]+SIZE, snakeArray.get(tailNumber)[1],
                  snakeArray.get(tailNumber)[0]+SIZE/2, snakeArray.get(tailNumber)[1]+SIZE);
    } else if (tailDirection == 's') {
        triangle(snakeArray.get(tailNumber)[0], snakeArray.get(tailNumber)[1]+SIZE, 
                  snakeArray.get(tailNumber)[0]+SIZE, snakeArray.get(tailNumber)[1]+SIZE,
                    snakeArray.get(tailNumber)[0]+SIZE/2, snakeArray.get(tailNumber)[1]);
      } else if (tailDirection == 'd') {
          triangle(snakeArray.get(tailNumber)[0]+SIZE, snakeArray.get(tailNumber)[1], 
                    snakeArray.get(tailNumber)[0]+SIZE, snakeArray.get(tailNumber)[1]+SIZE,
                      snakeArray.get(tailNumber)[0], snakeArray.get(tailNumber)[1]+SIZE/2);
        } else {
          triangle(snakeArray.get(tailNumber)[0], snakeArray.get(tailNumber)[1], 
                    snakeArray.get(tailNumber)[0], snakeArray.get(tailNumber)[1]+SIZE,
                      snakeArray.get(tailNumber)[0]+SIZE, snakeArray.get(tailNumber)[1]+SIZE/2);
        }
    fill(255);
  }
}
