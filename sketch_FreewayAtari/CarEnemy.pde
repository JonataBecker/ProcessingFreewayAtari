class CarEnemy extends Enemy {
 
  CarEnemy(int road, ArrayList<Road> roads) {
    super(road, roads, 1, 30, 20); 
  }

  PImage getImage() {
    return images.getCar();
  }
}