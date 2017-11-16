class PoliceCarEnemy extends Enemy {

  PoliceCarEnemy(int road, ArrayList<Road> roads) {
    super(road, roads, 4, 40, 20); 
  }

  void move() {
    int tmp = x;
    x += (direction == DIRECTION_LEFT ? 20 * -1 : 20);
    usedEnergy = energy;
    int enemyEnergy = colider.isColided(this, roads.get(road));
    if (enemyEnergy >= 0) {
      usedEnergy = enemyEnergy;
      int maxRoad = (direction == DIRECTION_LEFT ? 5 : 10);
      if (road + 1 == maxRoad) {
        x = tmp + (direction == DIRECTION_LEFT ? usedEnergy * -1 : usedEnergy);
        return;
      }
      roads.get(road).remove(this);
      road++;
      roads.get(road).add(this);
      if (colider.isColided(this, roads.get(road)) >= 0) {
        roads.get(road).remove(this);
        road--;
        x = tmp + (direction == DIRECTION_LEFT ? usedEnergy * -1 : usedEnergy);
        roads.get(road).add(this);
        return;
      } 
    }
    x = tmp + (direction == DIRECTION_LEFT ? usedEnergy * -1 : usedEnergy);
  }

  PImage getImage() {
    return images.getPoliceCar();
  }

}