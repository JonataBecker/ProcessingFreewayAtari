class Colider {

  boolean isColided(Player player, ArrayList<Road> roads) {
    for (int r = 0; r < roads.size(); r++) {
      ArrayList<Enemy> enemies = roads.get(r).get();
      for (int i = 0; i < enemies.size(); i++) {
        if (player.isColided(enemies.get(i))) {
          return true;
        }
      }
    }
    return false;
  }

  boolean isColided(Enemy enemy, Road road) {
    ArrayList<Enemy> enemies = road.get();
    for (int i = 0; i < enemies.size(); i++) {
      if (enemy.isColided(enemies.get(i)) && enemy != enemies.get(i)) {
        return true;
      }
    }
    return false;
  }

  

}