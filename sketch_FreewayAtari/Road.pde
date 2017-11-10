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

  protected abstract void add(Enemy enemy);

  void generate() {
    add(new CarEnemy(id));
  }

  void display() {
    for (Enemy enemy : get()) {
      if (!config.isWin()) {
        enemy.move();  
      }
      enemy.display();
      if (enemy.x < 0 || enemy.x > config.width) {
        remove(enemy);
        if (!(enemy instanceof PoliceCarEnemy)) {
          generate();
        }
      }
    }  
  }
  
}