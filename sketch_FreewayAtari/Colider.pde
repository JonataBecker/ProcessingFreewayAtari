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
}