class Food {
  
  int xPos = 240;
  int yPos = 240;
  int size;
  boolean spawnInsideChecker = false;
  
  void reappear(ArrayList<int[]> snakeArray) {
    randomPosGenerator();
    for (int i = 0; i < snakeArray.size(); ++i) {
      if (snakeArray.get(i)[0] == xPos && snakeArray.get(i)[1] == yPos) {
        spawnInsideChecker = true;
      }
    }
    if (spawnInsideChecker == true) {
      spawnInsideChecker = false;
      reappear(snakeArray); 
    }
  }
  
  void exist() {
    square(xPos, yPos, size);
  }
  
  void randomPosGenerator() {
    int xTemp = ceil(random(479));
    int yTemp = ceil(random(479));
    xPos = xTemp - xTemp % size;
    yPos = yTemp - yTemp % size;
  }
}
