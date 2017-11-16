class TruckEnemy extends Enemy {
 
  TruckEnemy(int road, ArrayList<Road> roads) {
    super(road, roads, 2, 100, 30); 
  }

  PImage getImage() {
    return images.getTruck();
  }
}