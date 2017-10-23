abstract class Enemy {
  
  int enemyWidth = 10;
  int x = 0;
  int y = 0;
  
  Enemy(int x, int y) {
    this.x = x;
    this.y = y;
  }
 
  abstract void move();
  
  void display() {
    noStroke();
    fill(#f00f00);
    rect(x, y, enemyWidth, enemyWidth);
  }
  

}