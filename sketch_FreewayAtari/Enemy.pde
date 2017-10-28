abstract class Enemy {
  
  static final int DIRECTION_LEFT = 1;
  static final int DIRECTION_RIGHT = 2;
  
  int width = 30;
  int height = 20;
  int x = 0;
  int y = 0;
  int direction;
  
  Enemy() {
    this.direction = DIRECTION_RIGHT;
  }
 
  abstract void move();
  
  void display() {
    noStroke();
    fill(#f00f00);
    rect(x, y, width, height);
  }
  

}