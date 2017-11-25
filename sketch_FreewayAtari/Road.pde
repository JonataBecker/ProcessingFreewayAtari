abstract class Road {
  
  final int id;
  final Config config;
  final ArrayList<Enemy> enemies;
  Colider colider = new Colider();

  Road(int id, Config config) {
    this.id = id;
    this.config = config;
    this.enemies = new ArrayList<Enemy>();
  }

  protected void addEnemy(Enemy enemy) {
    int tmp = enemy.x;
    enemy.x += (enemy.direction == Enemy.DIRECTION_LEFT ? 10 * -1 : 10);
    if (colider.isColided(enemy, this) == -1) {
      enemy.x = tmp;
      this.enemies.add(enemy);
    }
  }

  protected int calcY(Enemy enemy) {
    return id * 40 + (55 + (40 - enemy.height) / 2);
  }

  void remove(Enemy enemy) {
    this.enemies.remove(enemy);
  }

  ArrayList<Enemy> get() {
    return new ArrayList<Enemy>(this.enemies);
  }

  int size() {
    return this.enemies.size();
  }

  boolean isEmpty() {
    return this.enemies.isEmpty();
  }

  protected abstract void add(Enemy enemy);

  void display() {
    for (Enemy enemy : get()) {
      if (!config.isFinished()) {
        enemy.move();  
      }
      enemy.display();
      if (enemy.x < (enemy.width * -1) || enemy.x > config.width) {
        remove(enemy);
      }
    }  
  }
  
}