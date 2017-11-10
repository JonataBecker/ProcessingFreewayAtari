class TruckEnemy extends Enemy {
 
  TruckEnemy(int road) {
    super(road, 2, 80, 30); 
  }

  void display() {
    noStroke();
    fill(#000000);
    rect(x, y, width, height);
  }

}