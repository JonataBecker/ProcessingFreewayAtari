class RightRoad extends Road {

  RightRoad(int id, Config config) {
    super(id, config);
  }

  void add(Enemy enemy) {
    enemy.x = 0;
    enemy.y = calcY();
    enemy.direction = Enemy.DIRECTION_RIGHT;
    addEnemy(enemy);
  }
  

}