class Food {
  
  // variables
  int xPos;
  int yPos;
  
  //quasiconstants
  int SIZE;
  
  // methods
  void frame() {
    fill(#FF2727);
    ellipseMode(CORNER);
    circle(xPos, yPos, SIZE);
    fill(#FFFFFF);
  }
  
  void spawnFoodCheck(List<int[]> snakeArray) {
    spawnFood();
    for (int i = 0; i < snakeArray.size(); ++i) {
      if (snakeArray.get(i)[0] == xPos && snakeArray.get(i)[1] == yPos) {
        spawnFoodCheck(snakeArray);
      }
    }
  }
  
  void spawnFood() {
    int xNewPos = ceil(random(height-1));
    int yNewPos = ceil(random(60, height-1));    
    // pushes the food particles into a grid
    xPos = xNewPos - xNewPos % SIZE;
    yPos = yNewPos - yNewPos % SIZE;
  }
}
