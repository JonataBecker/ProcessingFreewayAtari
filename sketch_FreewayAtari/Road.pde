class Road {
  
  ArrayList<Enemy> enemies;
  
  Road() {
    this.enemies = new ArrayList<Enemy>();
  }

  void add(Enemy enemy) {
     this.enemies.add(enemy);
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
  
}