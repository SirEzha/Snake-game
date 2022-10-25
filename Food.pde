class Food {
  
  int xPos = 240;
  int yPos = 240;
  int size;
  
  void reappear() {
    int xTemp = ceil(random(499));
    int yTemp = ceil(random(499));
    xPos = xTemp - xTemp % size;
    yPos = yTemp - yTemp % size;
  }
  
  void exist() {
    square(xPos, yPos, size);
  }
}
