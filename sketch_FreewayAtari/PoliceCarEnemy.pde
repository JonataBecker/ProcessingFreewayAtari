class PoliceCarEnemy extends Enemy {
 
  final ArrayList<Road> roads;

  Colider colider = new Colider();

  PoliceCarEnemy(int road, ArrayList<Road> roads) {
    super(road, 5, 30, 20); 
    this.roads = roads;
  }

  void move() {
    x += (direction == DIRECTION_LEFT ? enegy * -1 : enegy);
    if (colider.isColided(this, roads.get(road))) {
      roads.get(road).remove(this);
      road++;
      roads.get(road).add(this);
      if (colider.isColided(this, roads.get(road))) {
        roads.get(road).remove(this);
        road--;
        roads.get(road).add(this);
        x += (direction == DIRECTION_LEFT ? enegy * -1 : enegy) * -1;
      }
    }
  }

  void display() {
    noStroke();
    fill(#0366d6);
    rect(x, y, width, height);
  }

}