abstract class Enemy {
  
  static final int DIRECTION_LEFT = 1;
  static final int DIRECTION_RIGHT = 2;
  
  int road;
  int width;
  int height;
  int x = 0;
  int y = 0;
  int direction;
  int enegy = 1;

  Enemy(int road, int enegy, int width, int height) {
    this.direction = DIRECTION_RIGHT;
    this.enegy = enegy + (int) random(3);
    this.width = width;
    this.height = height;
  }
 
  void move() {
    x += (direction == DIRECTION_LEFT ? enegy * -1 : enegy);
  }
  
  void display() {
    noStroke();
    fill(#f00f00);
    rect(x, y, width, height);
  }

  boolean isColided(Enemy enemy) {
    return ((x >= enemy.x && x <= enemy.x + enemy.width) ||
          (x + width >= enemy.x && x + width <= enemy.x + enemy.width)) && 
          ((y >= enemy.y && y <= enemy.y + enemy.height) ||
          (y + height >= enemy.y && y + height <= enemy.y + enemy.height)); 
  }

}