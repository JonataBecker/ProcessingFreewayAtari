abstract class Road {
  
  final int id;
  final Config config;
  final ArrayList<Enemy> enemies;
  
  Road(int id, Config config) {
    this.id = id;
    this.config = config;
    this.enemies = new ArrayList<Enemy>();
  }

  protected void addEnemy(Enemy enemy) {
     this.enemies.add(enemy);
  }

  protected int calcY() {
    return id * 40 + 65;
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

  protected abstract void add(Enemy enemy);

  void generate() {
    add(new CarEnemy(4));
  }

  void display() {
    for (Enemy enemy : get()) {
      enemy.move();  
      enemy.display();
      if (enemy.x < 0 || enemy.x > 1000) {
          remove(enemy);
          generate();
      }
    }  
  }
  
}