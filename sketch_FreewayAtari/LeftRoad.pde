class LeftRoad extends Road {

  LeftRoad(int id, Config config) {
    super(id, config);
  }
  
  void add(Enemy enemy) {
    enemy.x = config.width;
    enemy.y = calcY();
    enemy.direction = Enemy.DIRECTION_LEFT;
    addEnemy(enemy);
  }
  
}