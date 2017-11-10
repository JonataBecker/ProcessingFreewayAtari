class RightRoad extends Road {

  RightRoad(int id, Config config) {
    super(id, config);
  }

  void add(Enemy enemy) {
    enemy.y = calcY(enemy);
    enemy.direction = Enemy.DIRECTION_RIGHT;
    addEnemy(enemy);
  }
  

}