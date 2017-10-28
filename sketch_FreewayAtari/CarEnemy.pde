class CarEnemy extends Enemy {
 
  int enegy = 1;
    
  CarEnemy(int limit) {
    super();
    this.enegy = (int) random(limit) + 1;
    println(random(limit));
  }
  
  void move() {
    x += (direction == DIRECTION_LEFT ? enegy * -1 : enegy);
  }

}