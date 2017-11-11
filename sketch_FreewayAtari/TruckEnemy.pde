class TruckEnemy extends Enemy {
 
  TruckEnemy(int road, ArrayList<Road> roads) {
    super(road, roads, 2, 80, 30); 
  }

  void display() {
    noStroke();
    fill(#000000);
    rect(x, y, width, height);
    fill(#FFFFFF);
    text(roads.get(road).get().indexOf(this), x + 5, y + 12);    
  }

}