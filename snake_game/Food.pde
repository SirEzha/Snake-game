class Food {
  
  // variables
  int xPos = 240;
  int yPos = 240;
  
  //quasiconstants
  int SIZE;
  
  void reappear(ArrayList<int[]> snakeArray) {
    spawnNewFood();
    for (int i = 0; i < snakeArray.size(); ++i) {
      if (snakeArray.get(i)[0] == xPos && snakeArray.get(i)[1] == yPos) {
        reappear(snakeArray);
      }
    }
  }
  
  void frame() {
    fill(#FF2727);
    square(xPos, yPos, SIZE);
    fill(#FFFFFF);
  }
  
  void spawnNewFood() {
    int xNewPos = ceil(random(479));
    int yNewPos = ceil(random(60, 479));
    
    // pushes the food particles into a grid
    xPos = xNewPos - xNewPos % SIZE;
    yPos = yNewPos - yNewPos % SIZE;
  }
}
