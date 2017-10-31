class CarEnemy extends Enemy {
 
  int enegy = 1;
    
  CarEnemy(int limit) {
    super();
    this.enegy = (int) random(limit) + 1;
  }
  
  void move() {
    x += (direction == DIRECTION_LEFT ? enegy * -1 : enegy);
  }

}