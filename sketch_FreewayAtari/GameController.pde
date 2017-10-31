class GameController {

  final Player player;
  final ArrayList<Road> roads;
  final Colider colider = new Colider();
  final Congratulations congratulations = new Congratulations(config);
    
  GameController() {
    this.player = new Player(config);
    this.roads = new ArrayList<Road>();
    for (int i = 0; i < 10; i++) {
      Road road = new LeftRoad(i, config);
      if (i >= 5) {
        road = new RightRoad(i,  config);
      }
      road.generate();      
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