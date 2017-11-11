class RightRoad extends Road {

  RightRoad(int id, Config config) {
    super(id, config);
  }

  void add(Enemy enemy) {
    if (enemy.x == null) {
      enemy.x = enemy.width * -1;
    }
    enemy.y = calcY(enemy);
    enemy.direction = Enemy.DIRECTION_RIGHT;
    addEnemy(enemy);
  }
  

}