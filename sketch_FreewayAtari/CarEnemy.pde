class CarEnemy extends Enemy {
 
  CarEnemy(int road, ArrayList<Road> roads) {
    super(road, roads, 2, 30, 20); 
  }

  PImage getImage() {
    return images.getCar();
  }
}