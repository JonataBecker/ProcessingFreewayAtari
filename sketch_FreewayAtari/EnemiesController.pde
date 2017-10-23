class EnemiesController {

  ArrayList<Road> roads;

  EnemiesController() {
    this.roads = new ArrayList<Road>(); //<>//
    for (int i = 0; i < 10; i++) {
      this.roads.add(new Road());      
      buildEnemy(i); //<>//
    }
    
  }

  void display() {
    for (int i = 0; i < roads.size(); i++) {
      Road road = roads.get(i);
      for (Enemy enemy : road.get()) {
        enemy.move(); //<>//
        enemy.display();
        if (enemy.x < 0 || enemy.x > 1000) {
          road.remove(enemy);
          buildEnemy(i);
        }
      }
    }
  }

  void buildEnemy(int road) {
    this.roads.get(road).add(new CarEnemy(0, 40 * road + 70, 4));
  }

}