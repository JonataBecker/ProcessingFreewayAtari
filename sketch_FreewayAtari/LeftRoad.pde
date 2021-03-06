class LeftRoad extends Road {

  LeftRoad(int id, Config config) {
    super(id, config);
  }
  
  void add(Enemy enemy) {
    if (enemy.x == null) {
      enemy.x = config.width;
    }
    enemy.y = calcY(enemy);
    enemy.direction = Enemy.DIRECTION_LEFT;
    addEnemy(enemy);
  }
  
}