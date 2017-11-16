abstract class Enemy {
  
  static final int DIRECTION_LEFT = 1;
  static final int DIRECTION_RIGHT = 2;
  
  int road;
  final ArrayList<Road> roads;
  int width;
  int height;
  Integer x;
  Integer y = 0;
  int direction;
  int energy = 1;
  int usedEnergy = 1;
  Colider colider = new Colider();

  Enemy(int road, ArrayList<Road> roads, int energy, int width, int height) {
    this.road = road;
    this.direction = DIRECTION_RIGHT;
    this.energy = energy + (int) random(3);
    this.width = width;
    this.height = height;
    this.roads = roads;
  }
 
  void move() {
    int tmp = x;
    x += (direction == DIRECTION_LEFT ? 10 * -1 : 10);
    usedEnergy = energy;
    int enemyEnergy = colider.isColided(this, roads.get(road));
    if (enemyEnergy >= 0 && energy > enemyEnergy) {
      usedEnergy = enemyEnergy;
    }
    x = tmp + (direction == DIRECTION_LEFT ? usedEnergy * -1 : usedEnergy);
  }
  
  void display() {
    pushMatrix();
    if (direction == DIRECTION_RIGHT) {
      translate(x + width, y + height);
      rotate(PI);
    } else {
      translate(x, y);
    }
    image(getImage(), 0, 0, width, height);
    popMatrix();
  }

  PImage getImage() {
    return null;
  }

  boolean isColided(Enemy enemy) {
    return (
            (x >= enemy.x && x <= enemy.x + enemy.width) ||
            (x + width >= enemy.x && x + width <= enemy.x + enemy.width) ||
            (x <= enemy.x && x + width >= enemy.x + enemy.width) 
          ) && 
          (
            (y >= enemy.y && y <= enemy.y + enemy.height) ||
            (y + height >= enemy.y && y + height <= enemy.y + enemy.height) ||
            (y <= enemy.y && y + height >= enemy.y + enemy.height)
          ); 
  }

}