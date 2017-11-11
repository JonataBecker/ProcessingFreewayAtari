class GameController {

  final Player player;
  final ArrayList<Road> roads = new ArrayList<Road>();
  final Colider colider = new Colider();
  final Congratulations congratulations = new Congratulations(config);
  final EnemyGenerator generator = new EnemyGenerator(config, roads);
  
  GameController() {
    this.player = new Player(config);
    for (int i = 0; i < 10; i++) {
      Road road = new LeftRoad(i, config);
      if (i >= 5) {
        road = new RightRoad(i,  config);
      }
      this.roads.add(road);      
    }
  }
  
  void keyPressed(int keyCode) {
    if (config.isWin()) {
      return;
    }
    player.move(keyCode);
    if (player.isFinalSideWalk()) {
      config.addScore();
      player.initialPosition();
    }
  }
  
  void display() {
    for (int i = 0; i < roads.size(); i++) {
      Enemy enemy = generator.getEnemy(roads.get(i));
      if (enemy != null) {
        roads.get(i).add(enemy);
      }
      roads.get(i).display();     
    }
    if (colider.isColided(player, roads)) {
      player.moveBack();
    }
    player.display();
    if (config.isWin()) {
      congratulations.display();
    }
  }

}