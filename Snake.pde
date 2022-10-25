import java.util.ArrayList;

class Snake {
  
  int[] pos1 = {90, 30}; // initial position of the snake
  int[] pos2 = {60, 30};
  int[] pos3 = {30, 30};
  int xSpeed = 0;
  int ySpeed = 0;
  int size;
  
  
  /* This array is used to store positions of snake parts.
  It is a 2-dimensional array with extandable first dimension.
  It consists of n 2-element arrays, like that:
  
  [[x_1, y_1]
   [x_2, y_2]
     ...
   [x_n, y_n]]
   
  where x_i, y_i - coordinates of corresponding snake part
  */
  ArrayList<int[]> posArray = new ArrayList<int[]>(0);
  
   
  Snake() {
      posArray.add(pos1);
      posArray.add(pos2);
      posArray.add(pos3);
  }
  
  void move() {
    keyPressed();
    square(posArray.get(0)[0], posArray.get(0)[1], size);
    arrUpdater(0);
    for (int i = posArray.size() - 1; i > 0; --i) {
      posArray.set(i, posArray.get(i - 1));
      square(posArray.get(i)[0], posArray.get(i)[1], size);
    }
  }
  
  void keyPressed() {
    if (keyCode == UP) {
      xSpeed = 0;
      ySpeed = -size;
    }
    if (keyCode == DOWN) {
      xSpeed = 0;
      ySpeed = size;
    }
    if (keyCode == LEFT) {
      xSpeed = -size;
      ySpeed = 0;
    }
    if (keyCode == RIGHT) {
      xSpeed = size;
      ySpeed = 0;
    }
  }
  
  void eat() {
    int[] newPart = posArray.get(posArray.size() - 1);
    //for (int i = 0; i < posArray.size(); ++i) {
    //  arrUpdater(i);
    //}
    newPart[0] += posArray.get(posArray.size() - 1)[0] - posArray.get(posArray.size() - 2)[0];
    newPart[1] += posArray.get(posArray.size() - 1)[1] - posArray.get(posArray.size() - 2)[1];
    posArray.add(newPart);
  }
  
  
  
  // seemingly rudimentary function as array.get() works just as well
  void arrUpdater(int i) {
    int[] arrTemp = posArray.get(i);
    arrTemp[0] += xSpeed;
    arrTemp[1] += ySpeed;
    posArray.set(i, arrTemp);
  }
}
