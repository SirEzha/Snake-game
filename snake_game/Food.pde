class Food {
  
  int xPos = 240;
  int yPos = 240;
  int size;
  
  void reappear() {
    int xTemp = ceil(random(479));
    int yTemp = ceil(random(479));
    xPos = xTemp - xTemp % size;
    yPos = yTemp - yTemp % size;
  }
  
  void exist() {
    square(xPos, yPos, size);
  }
}
